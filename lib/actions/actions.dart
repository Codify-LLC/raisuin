import '/backend/api_requests/api_manager.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future test(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return WebViewAware(
        child: AlertDialog(
          title: Text('cool'),
          content: Text('cool'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: Text('Ok'),
            ),
          ],
        ),
      );
    },
  );
}
