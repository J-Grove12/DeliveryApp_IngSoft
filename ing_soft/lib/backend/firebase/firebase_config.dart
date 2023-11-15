import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBx4xwjU9bG-btzlolOh-lzxWSG_IML61g",
            authDomain: "ingsoft-1144b.firebaseapp.com",
            projectId: "ingsoft-1144b",
            storageBucket: "ingsoft-1144b.appspot.com",
            messagingSenderId: "652854888832",
            appId: "1:652854888832:web:00dcbc1ad2e265a7cbd965",
            measurementId: "G-MZZM86TCEM"));
  } else {
    await Firebase.initializeApp();
  }
}
