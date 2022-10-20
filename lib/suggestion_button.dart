import 'package:flutter/material.dart';

class SuggestionButton extends StatefulWidget {
  const SuggestionButton({super.key});

  @override
  State<SuggestionButton> createState() => _SuggestionButtonState();
}

class _SuggestionButtonState extends State<SuggestionButton> {
  double heightScaleFactor = 1 / 10;
  double suggestionWidthScaleFactor = 1 / 6;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (suggestionWidthScaleFactor),
      height: MediaQuery.of(context).size.height * (heightScaleFactor),
      child: TextButton(
          onPressed: () {},
          child: const Text(
            "",
            style: TextStyle(
                color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
          )),
    );
  }
}
