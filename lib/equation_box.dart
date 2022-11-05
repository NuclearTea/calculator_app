import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class EquationBox extends StatefulWidget {
  final resultantController = TextEditingController();
  var displayInput;

  EquationBox({super.key, required this.displayInput});

  // TextEditingController get controller => resultantController;

  String get getDisplayInput => displayInput;

  // set setDisplayInput(String displayInput) => this.displayInput = displayInput;

  @override
  State<EquationBox> createState() => _EquationBoxState();

  void setDisplayInput(String value) => displayInput = value;

  // void setDisplayInput(String value) {}
}

class _EquationBoxState extends State<EquationBox> {
  @override
  void initState() {
    super.initState();

    widget.resultantController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    widget.resultantController.dispose();
    super.dispose();
  }

  final String inputText = "";

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        label: Text(
          widget.getDisplayInput,
          textAlign: TextAlign.right,
        ),
      ),
      readOnly: true,
      style: const TextStyle(
        fontFamily: "Roboto",
        fontWeight: FontWeight.bold,
      ),
      keyboardType:
          const TextInputType.numberWithOptions(signed: true, decimal: true),
      textAlign: TextAlign.end,
      textDirection: TextDirection.ltr,
      controller: widget.resultantController,
    );
  }
}
