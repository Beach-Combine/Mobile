import 'package:beach_combine/data.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class BeachNearbyScreen extends StatefulWidget {
  @override
  _BeachNearbyScreenState createState() => _BeachNearbyScreenState();
}

class _BeachNearbyScreenState extends State<BeachNearbyScreen> {
  final String apiKey = GEO_CODING_KEY;
  Position? _currentPosition;
  String? _beachName;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Beach Nearby'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          if (_currentPosition != null && _beachName != null)
            Text(
              'You are near $_beachName!',
              style: TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
          if (_currentPosition == null || _beachName == null)
            CircularProgressIndicator(),
        ],
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    try {
      _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      String address = await _getAddressFromLatLng();
      print(address);
      if (address.contains('beach') ||
          address.contains('ocean') ||
          address.contains('Gwangan')) {
        _beachName = await _getBeachNameFromAddress(address);
        print(_beachName);
      }

      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  Future<String> _getAddressFromLatLng() async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${_currentPosition!.latitude},${_currentPosition!.longitude}&key=$apiKey';
    final response = await http.get(Uri.parse(url));
    final decodedResponse = json.decode(response.body);

    return decodedResponse['results'][0]['formatted_address'];
  }

  Future<String> _getBeachNameFromAddress(String address) async {
    // You can implement your own logic to extract the beach name from the address.
    // Here's an example of how to extract the beach name from the formatted address:
    List<String> addressParts = address.split(',');
    String beachName = '';
    for (int i = addressParts.length - 1; i >= 0; i--) {
      if (addressParts[i].toLowerCase().contains('beach') ||
          addressParts[i].toLowerCase().contains('ocean') ||
          addressParts[i].toLowerCase().contains('Gwangan')) {
        beachName = addressParts[i];
        break;
      }
    }
    beachName = 'Gwangan beach';
    return beachName;
  }
}
