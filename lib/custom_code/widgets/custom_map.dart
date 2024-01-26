// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as googleMaps;

class CustomMap extends StatefulWidget {
  const CustomMap({
    Key? key,
    this.width,
    this.height,
    required this.initialCenter,
    required this.lantlangs,
    required this.callBackAction,
    required this.userDoc,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng initialCenter;
  final List<LatLng> lantlangs;
  final List<UsersRecord> userDoc;

  final Future<dynamic> Function()? callBackAction;

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  late googleMaps.GoogleMapController mapController;
  Set<googleMaps.Marker> markers = {};

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: googleMaps.GoogleMap(
        initialCameraPosition: googleMaps.CameraPosition(
          target: googleMaps.LatLng(
            widget.initialCenter.latitude,
            widget.initialCenter.longitude,
          ),
          zoom: 10,
        ),
        onMapCreated: (controller) {
          setState(() {
            mapController = controller;
          });
        },
        markers: markers,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _createMarkers();
  }

  void _createMarkers() {
    markers.addAll(widget.lantlangs.map((raisunLatLng) {
      return googleMaps.Marker(
        markerId: googleMaps.MarkerId(raisunLatLng.toString()),
        position:
            googleMaps.LatLng(raisunLatLng.latitude, raisunLatLng.longitude),
        icon: googleMaps.BitmapDescriptor.defaultMarkerWithHue(
            googleMaps.BitmapDescriptor.hueAzure),
        // infoWindow: googleMaps.InfoWindow(title: "Testing", snippet: '*'),
        onTap: () {
          widget.callBackAction!();
        },
      );
    }));
  }
}
