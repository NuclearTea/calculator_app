import 'package:calculator_app/main.dart';
import 'package:calculator_app/suggestion_button.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

// class DisplayStringWidget extends StatefulWidget {
//   const DisplayStringWidget({super.key});

//   @override
//   State<DisplayStringWidget> createState() => _DisplayStringWidgetState();
// }

// class _DisplayStringWidgetState extends State<DisplayStringWidget> {
//   // String s = "";
//   void updateString() {
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DisplayStringWrapper(
//         string: "", updateString: updateString, child: MyApp());
//   }
// }

// class DisplayStringWrapper {
//   String string;
//   // final Widget child;
//   // final Function updateString;
//   // DisplayStringWrapper(
//   //     {Key? key,
//   //     required this.string,
//   //     // required this.child,
//   //     // required this.updateString})
//   //     : super(child: child, key: key);
//   // DisplayStringWrapper({super.key, required this.string}) : super(key: key);
//   DisplayStringWrapper(this.string);
//   void setDisplayString(DisplayStringWrapper data, String s) {
//     data.string = s;
//   }

//   String get getDisplayString {
//     return string;
//   }

//   void appendDisplayString(DisplayStringWrapper data, String s) {
//     data.string += s;
//   }

//   // static DisplayStringWrapper? of(BuildContext context) {
//   //   return (context.dependOnInheritedWidgetOfExactType<DisplayStringWrapper>());
//   // }

//   @override
//   bool updateShouldNotify(DisplayStringWrapper oldWidget) {
//     // TODO: implement updateShouldNotify
//     // throw UnimplementedError();
//     return string != oldWidget.getDisplayString;
//   }
// }

class DisplayStringWrapper {
  String string;
  DisplayStringWrapper(this.string);
  void setDisplayString(DisplayStringWrapper data, String s) {
    data.string = s;
  }

  String get getDisplayString {
    return string;
  }

  void appendDisplayString(DisplayStringWrapper data, String s) {
    data.string += s;
  }
}

// class DisplayStringWrapper extends StatefulWidget {
//   String string;

//   String get getDisplayString {
//     return string;
//   }

//   void setDisplayString(DisplayStringWrapper data, String s) {
//     data.string = s;
//   }

//   void appendDisplayString(DisplayStringWrapper data, String s) {
//     data.string += s;
//   }

//   final Function updateString;
//   DisplayStringWrapper(
//       {super.key, required this.string, required this.updateString});

//   @override
//   State<DisplayStringWrapper> createState() => _DisplayStringWrapperState();
// }

// class _DisplayStringWrapperState extends State<DisplayStringWrapper> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
