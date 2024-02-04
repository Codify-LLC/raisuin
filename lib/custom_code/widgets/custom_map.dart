// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
import 'dart:typed_data';
import 'dart:ui' as ui;
import '../../backend/api_requests/api_calls.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({
    Key? key,
    this.width,
    this.height,
    required this.initialCenter,
    required this.userDocs,
    required this.latLangList,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng initialCenter;
  final List<UsersRecord> userDocs;
  final List<LatLng> latLangList;

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  late google_maps.GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Set<google_maps.Marker>>(
        future: _buildMarkers(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return google_maps.GoogleMap(
              initialCameraPosition: google_maps.CameraPosition(
                target: google_maps.LatLng(
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
              markers: snapshot.data!,
            );
          } else {
            return Container();
          }
        });
  }

  @override
  void initState() {
    super.initState();
  }

  Future<Set<google_maps.Marker>> _buildMarkers() async {
    Set<google_maps.Marker> result = {};

    for (int i = 0; i < widget.userDocs.length; i++) {
      final UsersRecord user = widget.userDocs[i];

      // Convert photo URL to image
      final Image image = Image.network(user.photoUrl);

      // Create a BitmapDescriptor from the cropped image
      final google_maps.BitmapDescriptor bitmapDescriptor =
          await _createCircularBitmapDescriptor(image);

      // Add the marker to the set
      final google_maps.Marker marker = google_maps.Marker(
        markerId: google_maps.MarkerId("marker_$i"),
        position: const google_maps.LatLng(0.0, 0.0), // Set the marker position
        icon: bitmapDescriptor,
      );

      result.add(marker);
    }

    return result;
  }

  Future<google_maps.BitmapDescriptor> _createCircularBitmapDescriptor(
      Image image) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Paint paint = Paint()..color = Colors.transparent;

    final Radius radius = Radius.circular(image.width! / 2);

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromPoints(
          const Offset(0.0, 0.0),
          Offset(
            image.width!.toDouble(),
            image.height!.toDouble(),
          ),
        ),
        topLeft: radius,
        topRight: radius,
        bottomLeft: radius,
        bottomRight: radius,
      ),
      paint,
    );

    canvas.drawImage(
      image.image as ui.Image,
      const Offset(0.0, 0.0),
      paint,
    );

    final ui.Picture picture = pictureRecorder.endRecording();
    final ui.Image img = await picture.toImage(
      image.width!.toInt(),
      image.height!.toInt(),
    );

    final ByteData? byteData = await img.toByteData(
      format: ui.ImageByteFormat.png,
    )!;

    final Uint8List uint8List = byteData!.buffer.asUint8List();

    return google_maps.BitmapDescriptor.fromBytes(uint8List);
  }
}

Future<Uint8List?> getMarkerBytes(String photoUrl) async {
  if (photoUrl.isNotEmpty) {
    final ApiCallResponse apiCall = await GetImageByteDataCall.call(
      url: photoUrl,
    );
    return apiCall.response!.bodyBytes;
  } else {
    return null;
  }
}
