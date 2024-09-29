import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(
    myApp(),
  );
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
    return const Placeholder();
  }
}
