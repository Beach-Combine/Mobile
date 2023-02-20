import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMananger {
  static Future<Marker> resizeImage(LatLng sourceLocation, String markerPath,
      String markerId, int size, Function()? onTap) async {
    final Uint8List markerIcon = await getBytesFromAsset(markerPath, size);
    final Marker marker = Marker(
        icon: BitmapDescriptor.fromBytes(markerIcon),
        markerId: MarkerId(markerId),
        position: sourceLocation,
        onTap: onTap);
    return marker;
  }

  static Future<BitmapDescriptor> resizedIcon(
      String markerPath, int size) async {
    final Uint8List markerIcon = await getBytesFromAsset(markerPath, size);
    final icon = BitmapDescriptor.fromBytes(markerIcon);
    return icon;
  }

  static Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }
}
