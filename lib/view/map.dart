import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  _MapState createState() => _MapState();
}

class _MapState extends State<Map> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Google Map '),
      ),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(23.81735, 90.37050),
          zoom: 19
        ),
      ),
    );
  }
}
