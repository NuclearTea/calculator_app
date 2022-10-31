import 'dart:collection';
// import 'package:calculator_app/resultant_form.dart';
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

  // late var _addNumberToQueue = int.parse(resultantController.text);
  Queue recentHistory = Queue();
  final resultantController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    resultantController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double heightScaleFactor = 1 / 10;
    double suggestionWidthScaleFactor = 1 / 6;
    double dividerWidthScaleFactor = 1 / 500;

    print(acceptableValues.length);
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
            height: MediaQuery.of(context).size.height * (heightScaleFactor),
            color: Colors.grey.shade200,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(fontFamily: "Roboto"),
              keyboardType: TextInputType.text,
              textAlign: TextAlign.end,
              controller: resultantController,
            ),
          ),
          GridView(
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
                          setState(() {});
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
                  .toList())
        ],
      ),
      // Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: GridView.builder(
      //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //         crossAxisCount: 4, crossAxisSpacing: 12, mainAxisSpacing: 12),
      //     itemCount: acceptableValues.length,
      //     itemBuilder: (context, index) {
      //       return Container(
      //         color: Colors.black,
      //       );
      //     },
      //   ),
      // )
      // GridView.count(
      //   primary: false,
      //   padding: const EdgeInsets.all(20),
      //   crossAxisSpacing: 10,
      //   mainAxisSpacing: 10,
      //   crossAxisCount: 2,
      //   children: <Widget>[
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.teal[100],
      //       child: const Text("He'd have you all unravel at the"),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.teal[200],
      //       child: const Text('Heed not the rabble'),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.teal[300],
      //       child: const Text('Sound of screams but the'),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.teal[400],
      //       child: const Text('Who scream'),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.teal[500],
      //       child: const Text('Revolution is coming...'),
      //     ),
      //     Container(
      //       padding: const EdgeInsets.all(8),
      //       color: Colors.teal[600],
      //       child: const Text('Revolution, they...'),
      //     ),
      //     ],
      //   )
      // ],
    );
  }
}
