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

import 'package:google_maps_flutter/google_maps_flutter.dart' as googleMaps;
import 'package:image/image.dart' as img;
import '../../backend/api_requests/api_calls.dart';
import '../../backend/api_requests/api_manager.dart';
import '../../components/candidate_profile_card/candidate_profile_card_widget.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({
    Key? key,
    this.width,
    this.height,
    required this.initialCenter,
    required this.userDoc,
    required this.latLangList,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng initialCenter;
  final List<UsersRecord> userDoc;
  final List<LatLng> latLangList;

  @override
  _CustomMapState createState() => _CustomMapState();
}

class _CustomMapState extends State<CustomMap> {
  late googleMaps.GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _createMarkers(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return googleMaps.GoogleMap(
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
            markers: snapshot.data!.toSet(),
          );
        } else {
          return Container();
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _createMarkers();
  }

  Future<List<googleMaps.Marker>> _createMarkers() async {
    List<Future<googleMaps.Marker>> markerFutures = [];

    for (UsersRecord userData in widget.userDoc) {
      LatLng latLng = userData.address.latLang ?? LatLng(0.0, 0.0);
      String photoUrl = userData.photoUrl;

      markerFutures.add(
        getMarkerBytes(photoUrl).then((iconBytes) async {
          return googleMaps.Marker(
            markerId: googleMaps.MarkerId(latLng.hashCode.toString()),
            position: googleMaps.LatLng(latLng.latitude, latLng.longitude),
            icon: iconBytes != null
                ? googleMaps.BitmapDescriptor.fromBytes(img.encodeBmp(img
                    .copyCropCircle(img.decodeImage(iconBytes)!, radius: 50)))
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
          );
        }),
      );
    }

    return Future.wait(markerFutures);
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
}
