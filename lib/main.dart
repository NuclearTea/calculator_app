import 'dart:collection';
// import 'package:calculator_app/resultant_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:math_expressions/math_expressions.dart";
import "package:function_tree/function_tree.dart";
import 'package:basic_utils/basic_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: BasicCalculator(
      title: '',
    ));
    // return MaterialApp(
    //   title: 'Flutter Demo',
    //   theme: ThemeData(
    //     // This is the theme of your application.
    //     //
    //     // Try running your application with "flutter run". You'll see the
    //     // application has a blue toolbar. Then, without quitting the app, try
    //     // changing the primarySwatch below to Colors.green and then invoke
    //     // "hot reload" (press "r" in the console where you ran "flutter run",
    //     // or simply save your changes to "hot reload" in a Flutter IDE).
    //     // Notice that the counter didn't reset back to zero; the application
    //     // is not restarted.
    //     primarySwatch: Colors.blue,
    //   ),
    //   home: const MyHomePage(title: 'Flutter Demo Home Page'),
    // );
  }
}

class BasicCalculator extends StatefulWidget {
  const BasicCalculator({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<BasicCalculator> createState() => _BasicCalculatorState();
}

evaluateExpression(String equation) {
  return equation.interpret().toString();
}

class _BasicCalculatorState extends State<BasicCalculator> {
  List<String> acceptableValues = [
    "(",
    ")",
    "^",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "+/-",
    "0",
    ".",
    "=",
  ];

  List<String> numberValues = [
    "0",
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9"
  ];

  List<String> operations = ["+", "-", "x", "/"];

  String negate = "+/-";
  String equalButton = "=";

  List<String> recentHistory = List<int>.filled(4, 0).map((e) => "").toList();

  String displayString = "";
  String equation = "";

  int primaryDefault = 0xff6667ab;
  int primaryLight = 0xff9695dd;
  int primaryDark = 0xff373d7b;
  int secondaryDefault = 0xff4f508f;
  int secondaryLight = 0xff7e7cc0;
  int secondaryDark = 0xff202861;

  int suggestionButtoncounter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color(primaryLight),
              Color(primaryDefault),
              Color(primaryDark),
              Color(secondaryDark),
              Color(secondaryDefault),
              Color(secondaryLight)
            ])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppBar(
              actions: [
                suggestionButton(secondaryDark, 0),
                suggestionButton(secondaryDark, 1),
                suggestionButton(secondaryDark, 2),
                suggestionButton(secondaryDark, 3)
              ],
              // )
            ),
            Expanded(
              // equation bar
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(secondaryDefault),
                ),
                child: Row(
                  children: [
                    Expanded(
                      // delete button
                      flex: 1,
                      child: IconButton(
                          iconSize: 40,
                          onPressed: () => setState(() => equation = ""),
                          icon: const Icon(Icons.delete)),
                    ),
                    Expanded(
                      // displays equation
                      flex: 9,
                      child: Text(
                        equation,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white24,
                          fontFamily: "Roboto",
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Expanded(
                      // copy to clipboard button
                      flex: 1,
                      child: IconButton(
                        onPressed: () =>
                            Clipboard.setData(ClipboardData(text: equation))
                                .then((value) => ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content:
                                          Text("The Equation has been copied!"),
                                      duration: Duration(seconds: 1),
                                    ))),
                        icon: const Icon(Icons.content_copy_rounded),
                        tooltip: "$equation has been copied to clipboard",
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(primaryLight),
                ),
                width: double.infinity,
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: IconButton(
                          iconSize: 60,
                          alignment: Alignment.centerLeft,
                          onPressed: () => setState(() => displayString = ""),
                          icon: const Icon(Icons.delete)),
                    ),
                    Expanded(
                      // Delete string button
                      flex: 24,
                      child: Text(
                        displayString,
                        style: const TextStyle(
                            color: Colors.black87,
                            fontFamily: "Roboto",
                            fontSize: 32,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.end,
                      ),
                    ),
                    Column(
                      children: [
                        IconButton(
                            // paste clipboard button
                            iconSize: 30,
                            onPressed: () => setState(() {
                                  Clipboard.getData(Clipboard.kTextPlain)
                                      .then((value) {
                                    String s0 = displayString;
                                    var s1 = s0 += value!.text!;
                                    displayString = s1;
                                  });
                                }),
                            icon: const Icon(Icons.paste_rounded)),
                        Expanded(
                          // delete most recent charecter button
                          flex: 8,
                          child: IconButton(
                              iconSize: 40,
                              alignment: Alignment.centerRight,
                              onPressed: () => setState(() => displayString =
                                  displayString.substring(
                                      0, displayString.length - 1)),
                              icon:
                                  const Icon(Icons.arrow_circle_left_rounded)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  color: Color(primaryDark)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 40,
                    ),
                    children: acceptableValues
                        .map(
                          (value) => Container(
                            margin: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(primaryLight),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)))),
                              onPressed: () {
                                setState(() {
                                  if (value == equalButton) {
                                    // equal button is pressed
                                    equation =
                                        displayString; // equation bar is set to current unsolved equation in main bar
                                    var answer = displayString.replaceAll('x',
                                        "*"); // replaces x with * as library doesn't recognize x as multiplication
                                    displayString = evaluateExpression(
                                        answer); // display string is now the answer

                                    recentHistory[suggestionButtoncounter % 4] =
                                        displayString; // mod 4 because then only values given are [0,3]
                                    suggestionButtoncounter++;
                                  } else if (value == negate) {
                                    // button pressed == "+/-"
                                    if (displayString[0] != "-") {
                                      displayString =
                                          StringUtils.addCharAtPosition(
                                              displayString, "-", 0);
                                    } else {
                                      // first element is "-"
                                      displayString =
                                          StringUtils.removeCharAtPosition(
                                              displayString,
                                              1); // int value represents position, so it starts at 1
                                    }
                                  } else {
                                    // appends on button value
                                    displayString += value;
                                  }
                                  print(displayString);
                                });
                              },
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                    fontFamily: "Roboto",
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                        .toList()),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded suggestionButton(int color, int index) {
    return Expanded(
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(color)),
              shape:
                  MaterialStateProperty.all(const ContinuousRectangleBorder())),
          onPressed: () {
            setState(() {
              displayString += recentHistory[index];
            });
            print("suggestion button ${recentHistory[0]} pressed");
          },
          child: Text(
            recentHistory[index],
            style: const TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white54),
          )),
    );
  }
}
