import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Container(
        color: Colors.grey.shade200,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
                flex: 50,
                child: TextButton.icon(
                  icon: Icon(Icons.menu_rounded),
                  onPressed: () {},
                  label: const Text(""),
                )
                // child: Padding(
                //   padding: EdgeInsets.fromLTRB(60, 10, 10, 10),
                //   child: Text(
                //     "",
                //     textAlign: TextAlign.start,
                //     style: TextStyle(
                //       fontSize: 28,
                //     ),
                //   ),
                // ),
                ),
            const Expanded(
              flex: 1,
              child: Text(
                "|",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Expanded(
              flex: 20,
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
            const Expanded(
              flex: 1,
              child: Text(
                "|",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Expanded(
                flex: 20,
                child: TextButton(
                    onPressed: () {}, child: const Text("Suggestion"))),
            const Expanded(
              flex: 1,
              child: Text(
                "|",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Expanded(
                flex: 20,
                child: TextButton(
                    onPressed: () {}, child: const Text("Suggestion"))),
            const Expanded(
              flex: 1,
              child: Text(
                "|",
                textAlign: TextAlign.end,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            Expanded(
                flex: 20,
                child: TextButton(
                    onPressed: () {}, child: const Text("Suggestion"))),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
