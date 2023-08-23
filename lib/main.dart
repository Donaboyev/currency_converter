import 'package:flutter/material.dart';

import 'app.dart';
import 'dependency_manager.dart';
import 'local_source.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpDependencies();
  await LocalSource.getInstance();
  runApp(const MyApp());
}
