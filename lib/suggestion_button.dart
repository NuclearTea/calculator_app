import 'package:calculator_app/color_pallette.dart';
import 'package:calculator_app/main.dart';
import 'package:calculator_app/pantone_colour_pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SuggestionButton extends StatefulWidget {
  DisplayStringWrapper data;
  int index;
  ColorPallette pallette;
  List<String> list;

  get getData => data;

  get getIndex => index;

  set setPallette(ColorPallette p) => pallette = p;
  get getPallette => pallette;

  get getList => list;

  // // ignore: prefer_const_constructors_in_immutables
  // SuggestionButton(
  //     // DisplayStringWrapper data,
  //     // int index,
  //     // required Color color,
  //     ColorPallette pallette,
  //     List<String> list,
  //     {super.key,
  //     required DisplayStringWrapper data,
  //     required int index});

  SuggestionButton(this.data, this.index, this.list, this.pallette,
      {super.key});

  @override
  State<SuggestionButton> createState() => _SuggestionButtonState();
}

class _SuggestionButtonState extends State<SuggestionButton> {
  // set setIndex(int index) => this.index = index;

  // String displayString = "";
  // String get getDisplayString => displayString;
  // set setDisplayString(String displayString) =>
  //     this.displayString = displayString;
  // set setDisplayString(String string) {
  //   if (displayString != string) displayString = string;
  // }

  // void setDisplayString(String s) {
  //   displayString = s;
  // }

  // final ColorPallette pallette = ColorPallette();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Color(widget.pallette.getSecondaryDark)),
              shape:
                  MaterialStateProperty.all(const ContinuousRectangleBorder())),
          onPressed: () {
            setState(() {
              // setDisplayString(getDisplayString + getList[getIndex]);
              widget.data.appendDisplayString(
                  widget.data, widget.getList[widget.index]);
            });
            print("suggestion button ${widget.index + 1} pressed");
          },
          child: Text(
            widget.getList[widget.index],
            style: const TextStyle(
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.white54),
          )),
    );
  }
}
