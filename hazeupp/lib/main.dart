import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hazeupp/app.dart';
import 'package:hazeupp/data/repositories/authentication/authentication_repository.dart';
import 'package:hazeupp/firebase_options.dart';

// Entry point of flutter app
Future<void> main() async {
  // widgets binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  // GetX Local Storage
  await GetStorage.init();

  // Todo: Init payment methods
  // Await splash until items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Todo: Initialise firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then(
    (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );

  // Todo: Initialise Authentication

  // Load all the material design themes / localizations / bindings
  runApp(const App());
}
