// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:google_maps_flutter/google_maps_flutter.dart' as googleMaps;
import 'package:dio/dio.dart';
import 'package:image/image.dart' as img; // Import the image package
import '../../backend/api_requests/api_calls.dart';
import '../../components/candidate_profile_card_widget.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({
    Key? key,
    this.width,
    this.height,
    required this.initialCenter,
    required this.userDoc,
    required this.lantlangs,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng initialCenter;
  final List<UsersRecord> userDoc;
  final List<LatLng> lantlangs;

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

  void _createMarkers() async {
    List<Future<void>> markerFutures = [];

    for (var userData in widget.userDoc) {
      var latLng = _getLatLng(userData.address);
      var photoUrl = userData.photoUrl;

      markerFutures.add(
        getMarkerBytes(photoUrl).then((iconBytes) async {
          markers.add(googleMaps.Marker(
            markerId: googleMaps.MarkerId(latLng.hashCode.toString()),
            position: googleMaps.LatLng(latLng.latitude, latLng.longitude),
            icon: iconBytes != null
                ? (await _createMarkerIcon(iconBytes))
                : googleMaps.BitmapDescriptor.defaultMarkerWithHue(
                    googleMaps.BitmapDescriptor.hueAzure),
            onTap: () async {
              await showDialog(
                context: context,
                builder: (dialogContext) {
                  return Dialog(
                    elevation: 0,
                    insetPadding: EdgeInsets.zero,
                    backgroundColor: Colors.transparent,
                    alignment: AlignmentDirectional(0, 0)
                        .resolve(Directionality.of(context)),
                    child: WebViewAware(
                      child: GestureDetector(
                        child: CandidateProfileCardWidget(
                          userRef: userData.reference,
                        ),
                      ),
                    ),
                  );
                },
              ).then((value) => setState(() {}));
            },
          ));
        }),
      );
    }

    await Future.wait(markerFutures);
  }

  Future<googleMaps.BitmapDescriptor> _createMarkerIcon(
    Uint8List imageFile, {
    int size = 50,
    bool addBorder = true,
    Color borderColor = const Color.fromARGB(255, 0, 0, 0),
    double borderSize = 10,
  }) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color;
    final double radius = size / 2;

    //make canvas clip path to prevent image drawing over the circle
    final Path clipPath = Path();
    clipPath.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()),
        Radius.circular(100)));
    clipPath.addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(0, size * 8 / 10, size.toDouble(), size * 3 / 10),
        Radius.circular(100)));
    canvas.clipPath(clipPath);

    //paintImage
    final Uint8List imageUint8List = imageFile;
    final ui.Codec codec = await ui.instantiateImageCodec(imageUint8List);
    final ui.FrameInfo imageFI = await codec.getNextFrame();
    paintImage(
        canvas: canvas,
        rect: Rect.fromLTWH(0, 0, size.toDouble(), size.toDouble()),
        image: imageFI.image);

    if (addBorder) {
      //draw Border
      paint..color = borderColor;
      paint..style = PaintingStyle.stroke;
      paint..strokeWidth = borderSize;
      canvas.drawCircle(Offset(radius, radius), radius, paint);
    }

    //convert canvas as PNG bytes
    final _image = await pictureRecorder
        .endRecording()
        .toImage(size, (size * 1.1).toInt());
    final data = await _image.toByteData();

    //convert PNG bytes as BitmapDescriptor
    return googleMaps.BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
  }

//  dimension.toInt()
  LatLng _getLatLng(AddressStruct address) {
    return address.latLang ?? LatLng(0.0, 0.0);
  }

  Future<Uint8List?> getMarkerBytes(String photoUrl) async {
    if (photoUrl.isNotEmpty) {
      final ApiCallResponse apiCall = await GetImageByteDataCall.call(
        url: photoUrl,
      );
      return Uint8List.fromList(apiCall.bodyText.codeUnits);
    } else {
      return null;
    }
  }
}
