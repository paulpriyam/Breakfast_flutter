import 'dart:io';

import 'package:fitness/constants/constants.dart';
import 'package:fitness/model/diet_model.dart';
import 'package:fitness/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //init Hive
  await Hive.initFlutter();

  //register adapter
  Hive.registerAdapter(DietModelAdapter());

  //open a box
  await Hive.openBox(Constants.HIVE_BOX);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins', primarySwatch: Colors.yellow),
      home: HomePage(),
    );
  }
}
