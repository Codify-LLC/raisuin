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

// import 'package:video_player/video_player.dart';

// class HlsOnePlus extends StatefulWidget {
//   const HlsOnePlus({
//     Key? key,
//     this.width,
//     this.height,
//     required this.videoUrl,
//   }) : super(key: key);

//   final double? width;
//   final double? height;
//   final String videoUrl;

//   @override
//   _HlsOnePlusState createState() => _HlsOnePlusState();
// }

// class _HlsOnePlusState extends State<HlsOnePlus> {
//   late VideoPlayerController _controller;

//   @override
//   void initState() {
//     super.initState();
//     try {
//       _controller = VideoPlayerController.network(widget.videoUrl)
//         ..initialize().then((_) {
//           setState(() {});
//           _controller.play(); // Auto-play the video
//         });
//     } catch (e) {
//       print("Error initializing video player: $e");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: _controller.value.isInitialized
//           ? AspectRatio(
//               aspectRatio: _controller.value.aspectRatio,
//               child: VideoPlayer(_controller),
//             )
//           : CircularProgressIndicator(), // Display a loading indicator
//     );
//   }

//   // @override
//   // void dispose() {
//   //   super.dispose();
//   //   _controller.dispose(); // Dispose of the video player to release resources
//   // }
// }

class HlsOnePlus extends StatefulWidget {
  const HlsOnePlus({
    Key? key,
    this.width,
    this.height,
    required this.videoUrl,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String videoUrl;

  @override
  _HlsOnePlusState createState() => _HlsOnePlusState();
}

class _HlsOnePlusState extends State<HlsOnePlus> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
