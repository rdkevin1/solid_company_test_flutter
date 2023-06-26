import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  /// This widget is the root of your application.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Solid company test flutter'),
    );
  }
}

/// This widget is the home page of your application. It is stateful
class MyHomePage extends StatefulWidget {
  /// that it has a State object (defined below) that contains fields that 
  /// affect how it looks.
  const MyHomePage({super.key, required this.title});

  /// This class is the configuration for the state. It holds the values (in
  /// this case the title) provided by the parent (in this case the App widget) 
  /// and used by the build method of the State. Fields in a Widget subclass are
  /// always marked "final".
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color _backgroundColor = Colors.white;
  final double _welcomeTextFontSize = 35;
  static const int _maxRandomValue = 0xFFFFFF;

  ///Function to generate a random background color
  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor =
          Color(Random().nextInt(_maxRandomValue)).withOpacity(1.0);
    });
  }

  ///The _getTextColor() function analyzes the background color and returns an 
  ///appropriate text color (black or white) based on the necessary contrast to 
  ///ensure text readability on the given background.
  Color _getTextColor(Color backgroundColor) {
    const double redWeight = 0.299;
    const double greenWeight = 0.587;
    const double blueWeight = 0.114;
    const double luminanceThreshold = 0.5;

    final luminance = (redWeight * backgroundColor.red +
            greenWeight * backgroundColor.green +
            blueWeight * backgroundColor.blue) /
        255;

    return luminance > luminanceThreshold ? Colors.black : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _changeBackgroundColor();
      },
      child: Scaffold(
        backgroundColor: _backgroundColor,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Hello there',
                style: TextStyle(
                  color: _getTextColor(_backgroundColor),
                  fontSize: _welcomeTextFontSize,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
