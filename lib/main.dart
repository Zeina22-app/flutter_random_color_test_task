import 'dart:math';

import 'package:flutter/material.dart';

/// The main entry point of the application.
void main() {
  runApp(const MyApp());
}

/// The root widget of the application.
/// This widget sets up the [MaterialApp] with a theme and the home page.
class MyApp extends StatelessWidget {
  /// Creates an instance of [MyApp], the root widget of the application.
  const MyApp({super.key});
  /// Builds the widget tree for [MyApp].
  /// Sets up the [MaterialApp] with the theme and the home page.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Test Task',
      theme: ThemeData(
        // Using a seeded color scheme for consistency in theming.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      debugShowCheckedModeBanner: false,
      // Home page of the application.
      home: const MyHomePage(title: 'Flutter Test Task'),
    );
  }
}

/// A stateful widget that represents the home page of the app.
/// Displays a text message and allows the user to change the background color
/// by tapping anywhere on the screen.
class MyHomePage extends StatefulWidget {
  /// Constructor for [MyHomePage].
  const MyHomePage({required this.title, super.key});

  /// Title displayed in the [AppBar].
  final String title;
  /// Creates the mutable state for this widget.
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

/// The state for [MyHomePage].
/// Holds the current background color and provides the logic to
/// generate and apply a new random color when the screen is tapped.
class _MyHomePageState extends State<MyHomePage> {
  /// The background color of the screen. Starts with white.
  Color _backgroundColor = Colors.white;

  /// Generates a random RGB color and updates the background.
  void _changeBackgroundColor() {
    setState(() {
      _backgroundColor = Color.fromRGBO(
        Random().nextInt(256), // Red component: 0–255
        Random().nextInt(256), // Green component: 0–255
        Random().nextInt(256), // Blue component: 0–255
        1, // Full opacity
      );
    });
  }
  /// Resets the background color to white.
  void _resetBackgroundColor() {
    setState(() {
      _backgroundColor = Colors.white;
    });
  }
  /// Describes the part of the user interface represented by this widget.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Trigger background color change on tap.
      onTap: _changeBackgroundColor,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        color: _backgroundColor,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                tooltip: 'Reset background',
                onPressed: _resetBackgroundColor,
              ),
            ],
          ),
          body: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Hello there',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
