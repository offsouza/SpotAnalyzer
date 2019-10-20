import 'package:camera2/detectage.dart';
import 'package:camera2/inf.dart';
import 'package:flutter/material.dart';
//import 'package:async/async.dart';
import 'homepage.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(fontFamily: 'Roboto Mono'),
      home: Home(),
    ),
  );
}
