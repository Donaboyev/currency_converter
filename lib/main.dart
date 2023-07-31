import 'package:flutter/material.dart';

import 'app.dart';
import 'dependency_manager.dart';

Future<void> main() async {
  await setUpDependencies();
  runApp(const MyApp());
}
