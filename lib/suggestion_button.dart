// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

// class SuggestionButton extends StatefulWidget {
//   final Color color;
  
//   final List<String> list;
  
//   final int index;
  
//   late final String displayString;
//  get getDisplayString => this.displayString;

//  set setDisplayString(final displayString) => this.displayString = displayString;

//   SuggestionButton({
//     Key? key,
//     required this.color,
//     required this.list,
//     required this.index,
//     required this.displayString,
//   }) : super(key: key);

//   @override
//   State<SuggestionButton> createState() => SuggestionButtonState();
// }

// class SuggestionButtonState extends State<SuggestionButton> {
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       style: TextButton.styleFrom(
//         backgroundColor: widget.color,
//       ),
//       onPressed: () {
//         setState(() {
//           widget.setDisplayString();
//           widget.displayString + widget.list[widget.index];
//         });
//         print("suggestion button ${widget.index + 1} pressed");
//       },
//       child: Text(widget.list[widget.index]));
// };





// // import 'dart:ui';

// // import 'package:flutter/material.dart';





// // TextButton suggestionButton(
// //     Color color, List<String> list, int index, String displayString) {
// //   return TextButton(
// //       style: TextButton.styleFrom(
// //         backgroundColor: color,
// //       ),
// //       onPressed: () {
// //         setState(() {
// //           displayString = displayString + list[index];
// //         });
// //         print("suggestion button ${index + 1} pressed");
// //       },
// //       child: Text(list[index]));
// // }
