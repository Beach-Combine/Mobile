import 'dart:io';
import 'dart:math';

import 'package:beach_combine/controllers/image_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';
import 'package:image/image.dart';
import 'package:collection/collection.dart';

enum DetectionClasses { clean, dirt }

class ClassifierController extends GetxController {
  /// Instance of Interpreter
  late Interpreter _interpreter;
  late List<int> _inputShape;
  late List<int> _outputShape;

  late TensorImage _inputImage;
  late TensorBuffer _outputBuffer;

  late TfLiteType _inputType;
  late TfLiteType _outputType;

  static const String modelFile = "models/model.tflite";
  final int _labelsLength = 2;
  late var _probabilityProcessor;
  final category = Category('_label', 0.0).obs;
  List<String> labels = ['clean', 'dirt'];

  NormalizeOp get preProcessNormalizeOp => NormalizeOp(0, 1);
  NormalizeOp get postProcessNormalizeOp => NormalizeOp(0, 255);

  @override
  onInit() async {
    await loadModel();
    category.value = predict();
    super.onInit();
  }

  @override
  onClose() {
    _interpreter.close();
    super.onClose();
  }

  /// Loads interpreter from asset
  Future<void> loadModel() async {
    try {
      _interpreter = await Interpreter.fromAsset(
        modelFile,
        options: InterpreterOptions()..threads = 4,
      );
      _inputShape = _interpreter.getInputTensor(0).shape;
      _outputShape = _interpreter.getOutputTensor(0).shape;
      _inputType = _interpreter.getInputTensor(0).type;
      _outputType = _interpreter.getOutputTensor(0).type;
      _outputBuffer = TensorBuffer.createFixedSize(_outputShape, _outputType);
      _probabilityProcessor =
          TensorProcessorBuilder().add(postProcessNormalizeOp).build();
      _interpreter.allocateTensors();
    } catch (e) {
      print("Error while creating interpreter: $e");
    }
  }

  TensorImage _preProcess() {
    int cropSize = min(_inputImage.height, _inputImage.width);
    return ImageProcessorBuilder()
        .add(ResizeWithCropOrPadOp(cropSize, cropSize))
        .add(ResizeOp(
            _inputShape[1], _inputShape[2], ResizeMethod.NEAREST_NEIGHBOUR))
        .add(preProcessNormalizeOp)
        .build()
        .process(_inputImage);
  }

  Category predict() {
    final afterImage = Get.find<ImageController>().afterImage;

    File _image = File(afterImage!.path);
    Image image = decodeImage(_image.readAsBytesSync())!;

    final pres = DateTime.now().millisecondsSinceEpoch;
    _inputImage = TensorImage(_inputType);
    _inputImage.loadImage(image);
    _inputImage = _preProcess();
    final pre = DateTime.now().millisecondsSinceEpoch - pres;

    print('Time to load image: $pre ms');

    final runs = DateTime.now().millisecondsSinceEpoch;
    interpreter.run(_inputImage.buffer, _outputBuffer.getBuffer());
    final run = DateTime.now().millisecondsSinceEpoch - runs;

    print('Time to run inference: $run ms');

    Map<String, double> labeledProb = TensorLabel.fromList(
            labels, _probabilityProcessor.process(_outputBuffer))
        .getMapWithFloatValue();
    final pred = getTopProbability(labeledProb);

    return Category(pred.key, pred.value);
  }

  MapEntry<String, double> getTopProbability(Map<String, double> labeledProb) {
    var pq = PriorityQueue<MapEntry<String, double>>(compare);
    pq.addAll(labeledProb.entries);

    return pq.first;
  }

  int compare(MapEntry<String, double> e1, MapEntry<String, double> e2) {
    if (e1.value > e2.value) {
      return -1;
    } else if (e1.value == e2.value) {
      return 0;
    } else {
      return 1;
    }
  }

  /// Gets the interpreter instance
  Interpreter get interpreter => _interpreter;
}
