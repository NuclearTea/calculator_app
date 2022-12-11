import 'dart:collection';
// import 'package:calculator_app/resultant_form.dart';
import 'package:calculator_app/Apps/basic_calculator.dart';
import 'package:calculator_app/app_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:math_expressions/math_expressions.dart";
import "package:function_tree/function_tree.dart";
import 'package:basic_utils/basic_utils.dart';

void main() => runApp(MaterialApp(
      initialRoute: "/",
      routes: {
        "/BasicCalculator": (context) => const BasicCalculator(),
        "/": (context) => const AppSelectionScreen()
      },
    ));
