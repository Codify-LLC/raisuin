import 'package:flutter/material.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

Future test(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (alertDialogContext) {
      return WebViewAware(
        child: AlertDialog(
          title: const Text('cool'),
          content: const Text('cool'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(alertDialogContext),
              child: const Text('Ok'),
            ),
          ],
        ),
      );
    },
  );
}
