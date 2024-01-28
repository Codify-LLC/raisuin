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

// // Automatic FlutterFlow imports
// import '/backend/backend.dart';
// import '/backend/schema/structs/index.dart';
// import '/actions/actions.dart' as action_blocks;
// import '/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/widgets/index.dart'; // Imports other custom widgets
// import '/custom_code/actions/index.dart'; // Imports custom actions
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';
// // Begin custom widget code

// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart' as latlong;
// import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
// import 'package:flutter_map/plugin_api.dart';
// import 'dart:math';
// import 'dart:async';
// import 'dart:io';
// import 'dart:ui' as ui;
// import 'package:async/async.dart';
// import 'package:flutter/services.dart';
// import 'dart:typed_data';

// class CandidateMap extends StatefulWidget {
//   final double? width;
//   final double? height;
//   final Future<dynamic> Function() selectedCandidateBottomSheet;
//   final List<AddressStruct> markerCandiList;

//   const CandidateMap({
//     Key? key,
//     this.width,
//     this.height,
//     required this.selectedCandidateBottomSheet,
//     required this.markerCandiList,
//   }) : super(key: key);

//   @override
//   CandidateMapState createState() => CandidateMapState();
// }

// class CandidateMapState extends State<CandidateMap> {
//   List<Marker> markers = [];

//   late final MapController mapController;
//   late latlong.LatLng _currentMapCenter;

//   @override
//   void didUpdateWidget(covariant CandidateMap oldWidget) {
//     super.didUpdateWidget(oldWidget);

//     if (widget.markerCandiList != oldWidget.markerCandiList) {
//       // Marker data has changed, update markers
//       _fetchAndAddCandidates();
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     mapController = MapController();
//     _currentMapCenter = latlong.LatLng(
//       22.9734,
//       78.6569,
//     ); // Initialize _currentMapCenter
//     //_fetchAndAddCandidates();
//     _fetchAndAddCandidates().then((_) {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     print("MarkerCandiList length: ${widget.markerCandiList.length}");
//     return Container(
//       child: FlutterMap(
//         options: MapOptions(
//           center: _currentMapCenter,
//           zoom: 5.0,
//           maxZoom: 15.0,
//           minZoom: 5.0,
//           onPositionChanged: _onPositionChanged,
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
//             subdomains: ['a', 'b', 'c'],
//           ),
//           MarkerLayer(markers: markers),
//         ],
//       ),
//     );
//   }

//   Future<List<Marker>> _fetchAndAddCandidates() async {
//     markers.clear();

//     final candidateMarkers = <Marker>[];

//     List<dynamic> markerCan = widget.markerCandiList;

//     for (dynamic cand in markerCan) {
//       final imageUrl =
//           cand['profileimage'] ?? (cand['meta']['profileimage'] ?? '');
//       final gender = cand['gender'];
//       //print("Generating the Marker for ${canID}");

//       final marker = Marker(
//         width: 35.0,
//         height: 35.0,
//         point: widget.markerCan['latLang'],
//         builder: (ctx) => GestureDetector(
//           // onTap: () {
//           //   FFAppState().selectedCandidateID = cand['candidateid'];
//           //   widget.selectedCandidateBottomSheet();
//           // },
//           child: Container(
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               border: Border.all(
//                 color: _getBorderColor(gender),
//                 width: 3.0, // Adjust border width based on zoom
//               ),
//             ),
//             child: CircleAvatar(
//               backgroundImage: NetworkImage(imageUrl),
//             ),
//           ),
//         ),
//       );

//       candidateMarkers.add(marker);
//     }

//     await Future.delayed(Duration.zero);

//     setState(() {
//       _dataLoaded = true;
//       markers.addAll(candidateMarkers);
//     });

//     FFAppState().dataloaded = true;

//     print(candidateMarkers);
//     return candidateMarkers;
//   }

//   Color _getBorderColor(String gender) {
//     if (gender == 'male') {
//       return Color(0xFF4B39EF); // Male color
//     } else if (gender == 'female') {
//       return Color(0xFFDD3568); // Female color
//     } else {
//       return Color(0xFF2BB793); // Neutral color
//     }
//   }

//   void _onPositionChanged(MapPosition position, bool hasGesture) {
//     // Update the current map center when the map position changes

//     // final newLat = position.center!.latitude;
//     // final newLong = position.center!.longitude;

//     // Update the previous position
//     // FFAppState().mapLatitude = _currentMapCenter!.latitude;
//     // FFAppState().mapLongitude = _currentMapCenter!.longitude;
//   }
// }

class CandidateMap extends StatefulWidget {
  const CandidateMap({
    Key? key,
    this.width,
    this.height,
    required this.selectedCandidateBottomSheet,
    required this.markerCandiList,
  }) : super(key: key);

  final double? width;
  final double? height;
  final Future<dynamic> Function() selectedCandidateBottomSheet;
  final List<AddressStruct> markerCandiList;

  @override
  _CandidateMapState createState() => _CandidateMapState();
}

class _CandidateMapState extends State<CandidateMap> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
