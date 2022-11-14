import 'dart:collection';
// import 'package:calculator_app/resultant_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import "package:math_expressions/math_expressions.dart";
import "package:function_tree/function_tree.dart";
import 'package:circular_buffer/circular_buffer.dart';
// import 'package:calculator_app/suggestion_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: MyHomePage(
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

evaluateExpression(String equation) {
  return equation.interpret();
}

class _MyHomePageState extends State<MyHomePage> {
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

  String clear = "C";
  String equalButton = "=";
  String decimalPoint = ".";

  // Queue recentHistory = Queue();
  // final recentHistory = CircularBuffer<String>(4);
  // List<int> recentHistory = [];
  List<String> recentHistory = List<int>.filled(4, 0).map((e) => "").toList();
  // List<String> recentHistory = [];
  // var recentHistory = "";
  // List<String> recentHistory = List<String>.filled(4, " asdf");
  var displayString = "";
  var equation = "";

  int primaryDefault = 0xff6667ab;
  int primaryLight = 0xff9695dd;
  int primaryDark = 0xff373d7b;
  int secondaryDefault = 0xff4f508f;
  int secondaryLight = 0xff7e7cc0;
  int secondaryDark = 0xff202861;

  @override
  Widget build(BuildContext context) {
    double heightScaleFactor = 1 / 10;
    double suggestionWidthScaleFactor = 1 / 6;
    double dividerWidthScaleFactor = 1 / 500;

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
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(primaryDark),
              ),
              height: MediaQuery.of(context).size.height * (heightScaleFactor),
              // child: manualAppBar(heightScaleFactor: heightScaleFactor, dividerWidthScaleFactor: dividerWidthScaleFactor, suggestionWidthScaleFactor: suggestionWidthScaleFactor),
              child: AppBar(
                backgroundColor: Color(primaryLight),
                actions: [
                  suggestionButton(Color(secondaryDark), recentHistory, 0),
                  suggestionButton(Color(secondaryDark), recentHistory, 1),
                  suggestionButton(Color(secondaryDark), recentHistory, 2),
                  suggestionButton(Color(secondaryDark), recentHistory, 3),
                  // suggestionButton()

                  //   ElevatedButton(
                  //       onPressed: () => print("suggestion button 2 pressed"),
                  //       child: Text(recentHistory[1].toString())),
                  //   ElevatedButton(
                  //       onPressed: () => print("suggestion button 3 pressed"),
                  //       child: Text(recentHistory[2].toString())),
                  //   ElevatedButton(
                  //       onPressed: () => print("suggestion button 4 pressed"),
                  //       child: Text(recentHistory[3].toString())),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(12),
                  color: Color(secondaryDefault),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                          iconSize: 40,
                          onPressed: () => setState(() => equation = ""),
                          icon: const Icon(Icons.delete)),
                    ),
                    Expanded(
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
                  // borderRadius: BorderRadius.circular(12),
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
                      child: IconButton(
                          onPressed: () => setState(() {
                                Clipboard.getData(Clipboard.kTextPlain).then(
                                    (value) => displayString += value!.text!);
                              }),
                          icon: const Icon(Icons.paste_rounded)),
                    ),
                    Expanded(
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
                    Expanded(
                      flex: 8,
                      child: IconButton(
                          iconSize: 40,
                          alignment: Alignment.centerRight,
                          onPressed: () => setState(() => displayString =
                              displayString.substring(
                                  0, displayString.length - 1)),
                          icon: const Icon(Icons.arrow_circle_left_rounded)),
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
                            // decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(100)),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(primaryLight),
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20)))),
                              onPressed: () {
                                setState(() {
                                  if (value == equalButton) {
                                    equation = displayString;
                                    var answer =
                                        displayString.replaceAll('x', "*");
                                    displayString =
                                        evaluateExpression(answer).toString();
                                    recentHistory[0] =
                                        evaluateExpression(answer).toString();
                                  } else {
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

  Expanded suggestionButton(Color color, List<String> list, int index) {
    return Expanded(
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Color(secondaryDark)),
              shape:
                  MaterialStateProperty.all(const ContinuousRectangleBorder())),
          onPressed: () {
            setState(() {
              displayString = displayString + list[index];
            });
            print("suggestion button ${index + 1} pressed");
          },
          child: Text(
            list[index],
            style: const TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white54),
          )),
    );
  }

  /*
    Returns index of which suggetstion button should be repopulated next
  */
  int whichButton(List<String> list) {
    // first check if there are any empty suggestion button through the list of recent history
    bool fullList;
    // int indexOfEmptyButton;
    for (int i = 0; i < list.length; i++) {
      if (list[i] == "") {
        // emptyButton = true;
        // indexOfEmptyButton = i;
        return i;
      }
    }

    fullList = true;

    return 0;
  }
}

class manualAppBar extends StatelessWidget {
  const manualAppBar({
    Key? key,
    required this.heightScaleFactor,
    required this.dividerWidthScaleFactor,
    required this.suggestionWidthScaleFactor,
  }) : super(key: key);

  final double heightScaleFactor;
  final double dividerWidthScaleFactor;
  final double suggestionWidthScaleFactor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * (7 / 24),
          height: MediaQuery.of(context).size.height * (heightScaleFactor),
          child: IconButton(
            iconSize: 50,
            icon: const Icon(
              Icons.menu_rounded,
              color: Colors.white70,
            ),
            onPressed: () {},
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * (dividerWidthScaleFactor),
          child: const Text(
            "|",
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        SizedBox(
          width:
              MediaQuery.of(context).size.width * (suggestionWidthScaleFactor),
          height: MediaQuery.of(context).size.height * (heightScaleFactor),
          child: TextButton(
              onPressed: () {},
              child: const Text(
                "500",
                style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * (dividerWidthScaleFactor),
          child: Text(
            "|",
            textAlign: TextAlign.end,
            style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width *
                (suggestionWidthScaleFactor),
            height: MediaQuery.of(context).size.height * (heightScaleFactor),
            child:
                TextButton(onPressed: () {}, child: const Text("Suggestion"))),
        SizedBox(
          width: MediaQuery.of(context).size.width * (dividerWidthScaleFactor),
          child: const Text(
            "|",
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width *
                (suggestionWidthScaleFactor),
            height: MediaQuery.of(context).size.height * (heightScaleFactor),
            child:
                TextButton(onPressed: () {}, child: const Text("Suggestion"))),
        SizedBox(
          width: MediaQuery.of(context).size.width * (dividerWidthScaleFactor),
          child: const Text(
            "|",
            textAlign: TextAlign.end,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w100,
            ),
          ),
        ),
        SizedBox(
            width: MediaQuery.of(context).size.width *
                (suggestionWidthScaleFactor),
            height: MediaQuery.of(context).size.height * (heightScaleFactor),
            child:
                TextButton(onPressed: () {}, child: const Text("Suggestion"))),
      ],
    );
  }
}
