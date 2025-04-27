import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

import 'package:music_player/game_page.dart';
import 'package:music_player/home_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reaction Game',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(), // HomePage is the entry point
    );
  }
}
