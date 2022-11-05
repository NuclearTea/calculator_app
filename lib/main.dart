import 'dart:collection';
// import 'package:calculator_app/resultant_form.dart';
import 'package:calculator_app/equation_box.dart';
import 'package:calculator_app/suggestion_button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// class SuggestionButtonList extends StatefulWidget {
//   const SuggestionButtonList({super.key});

//   @override
//   State<SuggestionButtonList> createState() => _SuggestionButtonListState();
// }

// class _SuggestionButtonListState extends State<SuggestionButtonList> {
//   List<SuggestionButton> = [
//     SuggestionButton()
//   ]
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: const MyHomePage(
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

class _MyHomePageState extends State<MyHomePage> {
  List<String> acceptableValues = [
    "C",
    "(",
    ")",
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

  String clear = "C";
  String equalButton = "=";

  // late var _addNumberToQueue = int.parse(resultantController.text);
  Queue recentHistory = Queue();
  var displayString = "";
  var equation = "";

  // final resultantController = TextEditingController();

  // @override
  // void dispose() {
  //   // Clean up the controller when the widget is disposed.
  //   resultantController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    double heightScaleFactor = 1 / 10;
    double suggestionWidthScaleFactor = 1 / 6;
    double dividerWidthScaleFactor = 1 / 500;
    // EquationBox equationField = EquationBox(
    //   displayInput: displayString,
    // );

    // print(acceptableValues.length);
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.grey.shade200,
            ),
            height: MediaQuery.of(context).size.height * (heightScaleFactor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * (7 / 24),
                  height:
                      MediaQuery.of(context).size.height * (heightScaleFactor),
                  child: IconButton(
                    iconSize: 50,
                    icon: const Icon(
                      Icons.menu_rounded,
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      (dividerWidthScaleFactor),
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
                  height:
                      MediaQuery.of(context).size.height * (heightScaleFactor),
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
                  width: MediaQuery.of(context).size.width *
                      (dividerWidthScaleFactor),
                  child: Text(
                    "|",
                    textAlign: TextAlign.end,
                    style: TextStyle(color: Colors.grey.shade700, fontSize: 20),
                  ),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width *
                        (suggestionWidthScaleFactor),
                    height: MediaQuery.of(context).size.height *
                        (heightScaleFactor),
                    child: TextButton(
                        onPressed: () {}, child: const Text("Suggestion"))),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      (dividerWidthScaleFactor),
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
                    height: MediaQuery.of(context).size.height *
                        (heightScaleFactor),
                    child: TextButton(
                        onPressed: () {}, child: const Text("Suggestion"))),
                SizedBox(
                  width: MediaQuery.of(context).size.width *
                      (dividerWidthScaleFactor),
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
                    height: MediaQuery.of(context).size.height *
                        (heightScaleFactor),
                    child: TextButton(
                        onPressed: () {}, child: const Text("Suggestion"))),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text("$equation"),
                color: Colors.grey,
              ),
              Container(child: Text("$displayString"))
            ],
          ),
          // LayoutBuilder(
          //   builder: ((BuildContext context, BoxConstraints constraints) =>
          //       Container(
          //         height: constraints.maxHeight / 2,
          //         width: constraints.maxWidth / 2,
          //         decoration: BoxDecoration(
          //           color: Colors.grey.shade400,
          //         ),
          //         child: Text("Equation"),
          //       )),
          // ),
          // Container(child: Text("Equation input")),
          Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16)),
                color: Colors.black),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 3,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 50,
                  ),
                  children: acceptableValues
                      .map(
                        (value) => Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100)),
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                if (value == clear) {
                                  displayString = "";
                                } else if (value == equalButton) {
                                  ;
                                } else {
                                  displayString += value;
                                }
                                print(displayString);
                                // equationField.setDisplayInput(value.toString());
                                // equationField.displayInput = value;
                                // equationField.resultantController.text = value;
                                // equationField.resultantController.text
                                // print(equationField.resultantController.text);
                                // print(equationField.getDisplayInput);
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
    );
  }
}
