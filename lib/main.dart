import 'app.dart';
import 'local_source.dart';
import 'dependency_manager.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setUpDependencies();
  await LocalSource.getInstance();
  runApp(const MyApp());
}
