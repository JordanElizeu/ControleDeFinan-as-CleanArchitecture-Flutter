import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app/config/firebase_config.dart';
import 'app/modules/app_module.dart';
import 'app/modules/app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = Firebase.initializeApp(
    options: FirebaseConfiguration.firebaseOptions,
  );
  await app.whenComplete(
        () => runApp(
      ModularApp(
        module: AppModule(),
        child: const AppWidget(),
      ),
    ),
  );
}