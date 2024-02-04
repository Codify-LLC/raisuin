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
import 'package:widget_to_marker/widget_to_marker.dart';
import '../../components/candidate_profile_card/candidate_profile_card_widget.dart';

class CustomMap extends StatefulWidget {
  const CustomMap({
    Key? key,
    this.width,
    this.height,
    required this.initialCenter,
    required this.userDocs,
  }) : super(key: key);

  final double? width;
  final double? height;
  final LatLng initialCenter;
  final List<UsersRecord> userDocs;

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

      // Add the marker to the set
      final google_maps.Marker marker = google_maps.Marker(
        markerId: google_maps.MarkerId("marker_$i"),
        position: google_maps.LatLng(user.address.latLang?.latitude ?? 0.0,
            user.address.latLang?.longitude ?? 0.0), // Set the marker position
        icon: await CircleAvatar(
          backgroundColor: Colors.white,
          radius: 24.0,
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.photoUrl.isEmpty
                ? "https://cdn-icons-png.flaticon.com/512/456/456212.png"
                : user.photoUrl),
            radius: 20.0,
          ),
        ).toBitmapDescriptor(),
        consumeTapEvents: true,
        onTap: () async {
          await showDialog(
            context: context,
            builder: (dialogContext) {
              return Dialog(
                elevation: 0,
                insetPadding: EdgeInsets.zero,
                backgroundColor: Colors.transparent,
                alignment: const AlignmentDirectional(0, 0)
                    .resolve(Directionality.of(context)),
                child: CandidateProfileCardWidget(
                  userRef: user.reference,
                ),
              );
            },
          ).then((value) => setState(() {}));
        },
      );

      result.add(marker);
    }

    return result;
  }
}
