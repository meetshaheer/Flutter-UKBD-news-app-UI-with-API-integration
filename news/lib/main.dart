import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news/API/api-call.dart';
import 'package:news/constants/constant.dart';
import 'package:news/screen-contents/onboarding-buttons.dart';
import 'package:news/screens/home.dart';
import 'package:news/screens/on_boarding.dart';

void main(List<String> args) {
  runApp(myApp());
}

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: newsApp(),
    );
  }
}

class newsApp extends StatelessWidget {
  const newsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return homeView();
  }
}
