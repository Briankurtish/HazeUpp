import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hazeupp/app.dart';
import 'package:hazeupp/firebase_options.dart';

// Entry point of flutter app
Future<void> main() async {
  // Todo: Add widgets binding
  // Todo: Init Local Storage
  // Todo: Init payment methods
  // Todo: Await Native Splash
  // Todo: Initialise firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.to(AuthenticationRepository()),
  );
  // Todo: Initialise Authentication

  // Load all the material design themes / localizations / bindings
  runApp(const App());
}
