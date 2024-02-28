import 'package:flutter/material.dart';
import 'package:mausam_app/activities/Home.dart';
import 'package:mausam_app/activities/loading.dart';

void main() {
  runApp(MaterialApp(
    //home: const Home(),
    debugShowCheckedModeBanner: false,
    routes: {
      "/" : (context) => const loading(),
      "/home": (context) => const Home(),
      "/loading": (context) => const loading(),
    },
  ));
}

