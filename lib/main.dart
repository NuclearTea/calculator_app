import 'dart:collection';
// import 'package:calculator_app/resultant_form.dart';
import 'package:calculator_app/Apps/basic_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:math_expressions/math_expressions.dart";
import "package:function_tree/function_tree.dart";
import 'package:basic_utils/basic_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int index = 0;
  final pages = <Widget>[
    const BasicCalculator(),
    const Center(child: Text("Page 1")),
    const Center(child: Text("Page 2")),
    const Center(child: Text("Page 3")),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        height: 50,
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(
              icon: Icon(Icons.email_outlined),
              selectedIcon: Icon(Icons.email),
              label: "Page 1"),
          NavigationDestination(
              icon: Icon(Icons.chat_bubble_outlined),
              selectedIcon: Icon(Icons.chat_bubble),
              label: "Page 1"),
          NavigationDestination(
              icon: Icon(Icons.videocam_outlined),
              selectedIcon: Icon(Icons.videocam),
              label: "Page 1"),
        ],
      ),
    ));
  }
}
