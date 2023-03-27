import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart' show ByteData, Uint8List, rootBundle;
import 'package:path_provider/path_provider.dart';
import 'package:beach_combine/controllers/classifier_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter_helper/tflite_flutter_helper.dart';

class ModelTestScreen extends StatefulWidget {
  const ModelTestScreen({super.key});

  @override
  State<ModelTestScreen> createState() => _ModelTestScreenState();
}

class _ModelTestScreenState extends State<ModelTestScreen> {
  final classifier = Get.put(ClassifierController());

  File? _image;

  Image? _imageWidget;

  img.Image? fox;

  Category? category;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future getImage() async {
    // _image = await getImageFileFromAssets('assets/images/clean.jpeg');
    _image = await assetToFile(AssetImage('assets/images/dirt4.jpeg'));
    _imageWidget = Image.file(_image!);

    _predict();
  }

  void _predict() async {
    img.Image imageInput = img.decodeImage(_image!.readAsBytesSync())!;
    // var pred = classifier.predict(imageInput);

    setState(() {
      // this.category = pred;
    });
  }

  Future<File> assetToFile(AssetImage image) async {
    final ByteData byteData = await rootBundle.load(image.assetName);
    final Uint8List imageData = byteData.buffer.asUint8List();
    final Directory tempDir = await getTemporaryDirectory();
    final String tempPath = '${tempDir.path}/${DateTime.now().millisecond}.jpg';
    final File file = File(tempPath);
    await file.writeAsBytes(imageData);
    return file;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Image.asset('assets/images/dirt4.jpeg'),
        Text(
          category != null ? category!.label : '',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        ElevatedButton(onPressed: getImage, child: Text('classify')),
      ]),
    );
  }
}
