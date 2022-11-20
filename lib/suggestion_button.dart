import 'package:calculator_app/color_pallette.dart';
import 'package:calculator_app/display_string_widget.dart';
import 'package:calculator_app/main.dart';
import 'package:calculator_app/pantone_colour_pallette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SuggestionButton extends StatefulWidget {
  final DisplayStringWrapper data;
  final int index;
  // final Function() setString;
  // cannot make final because then setter won't work
  // it is final, cannot change value
  ColorPallette pallette;

  final List<String> list;

  // get getData => data;

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

  SuggestionButton(
    this.index,
    this.list,
    this.pallette, {
    super.key,
    required this.data,
  });

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
                  widget.data, widget.getList[widget.getIndex]);
              // build(context);
              // widget.data.setDisplayString(
              //     widget.data,
              //     widget.data.getDisplayString +
              //         widget.getList[widget.getIndex]);
            });
            print("suggestion button ${widget.index} pressed");
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
