import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AppSelectionScreen extends StatefulWidget {
  const AppSelectionScreen({super.key});

  @override
  State<AppSelectionScreen> createState() => _AppSelectionScreenState();
}

class _AppSelectionScreenState extends State<AppSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      // width: 300,
      // height: 100,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(
              iconSize: 50,
              icon: const Icon(Icons.calculate_rounded),
              onPressed: () {
                Navigator.pushNamed(context, "/BasicCalculator");
              },
            ),
            const Card(
                child: Text(
              "Basic Calculator",
              style: TextStyle(fontSize: 50),
            )),
          ],
        ),
        // color: Colors.lightBlueAccent.withOpacity(0.5),
      ),
    ));
  }
}
