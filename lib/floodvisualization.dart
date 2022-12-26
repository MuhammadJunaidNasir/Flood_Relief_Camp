import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class FloodVisualizationScreen extends StatefulWidget {
  const FloodVisualizationScreen({Key? key}) : super(key: key);

  @override
  State<FloodVisualizationScreen> createState() => _FloodVisualizationScreenState();
}

class _FloodVisualizationScreenState extends State<FloodVisualizationScreen> {

  static final CameraPosition _cameraPosition= const CameraPosition(
      target: LatLng(37.42, -122.085),
      zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flood Visualization'),
        backgroundColor: Colors.deepPurple,
      ),
      body: GoogleMap(
        initialCameraPosition: _cameraPosition,
      ),
    );
  }
}
