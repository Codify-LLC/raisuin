import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB2RQ7ZfnSVytxUShaOtsx__rcO1MkwpLc",
            authDomain: "teachnear.firebaseapp.com",
            projectId: "teachnear",
            storageBucket: "teachnear.appspot.com",
            messagingSenderId: "997321868188",
            appId: "1:997321868188:web:ff1c57cac03559037a7e59",
            measurementId: "G-9TY8QE1QGZ"));
  } else {
    await Firebase.initializeApp();
  }
}
