import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class InputField extends StatefulWidget {
  final String? hintText;
  final TextEditingController controller;
  final IconData prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;

  const InputField(
      {Key? key,
      required this.controller,
      this.hintText = '',
      required this.prefixIcon,
      this.suffixIcon,
      this.obscureText = false})
      : super(key: key);

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocus = false;
  Logger logger = Logger();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocus = _focusNode.hasFocus;
      });
      logger.i(_focusNode.hasFocus);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      padding: const EdgeInsets.fromLTRB(6, 5, 10, 5),
      decoration: BoxDecoration(
          color: const Color.fromRGBO(235, 231, 252, 1),
          borderRadius: BorderRadius.circular(50),
          boxShadow:
              !_isFocus ? null : [const BoxShadow(color: Colors.deepPurpleAccent, blurRadius: 5)]),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText,
        focusNode: _focusNode,
        cursorColor: Colors.black45,
        style: const TextStyle(fontSize: 18, letterSpacing: 1),
        decoration: InputDecoration(
            hintText: widget.hintText,
            suffixIcon: widget.suffixIcon,
            focusColor: Colors.deepPurpleAccent,
            prefixIcon: Icon(
              widget.prefixIcon,
              size: 30,
              color: Colors.black45,
            ),
            border: InputBorder.none),
      ),
    );
  }
}

// class InputField extends StatefulWidget {
//
//
//   @override
//   State<StatefulWidget> createState() {}
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
//       padding: const EdgeInsets.fromLTRB(6, 5, 10, 5),
//       decoration: BoxDecoration(
//           color: const Color.fromRGBO(235, 231, 252, 1),
//           borderRadius: BorderRadius.circular(50),
//           boxShadow: !(focusNode != null && focusNode!.hasFocus)
//               ? null
//               : [const BoxShadow(color: Colors.white10, blurRadius: 5)]),
//       child: TextField(
//         controller: controller,
//         obscureText: obscureText,
//         focusNode: focusNode,
//         cursorColor: Colors.black45,
//         style: const TextStyle(fontSize: 18, letterSpacing: 1),
//         decoration: InputDecoration(
//             hintText: hintText,
//             suffixIcon: suffixIcon,
//             focusColor: Colors.deepPurpleAccent,
//             prefixIcon: Icon(
//               prefixIcon,
//               size: 30,
//               color: Colors.black45,
//             ),
//             border: InputBorder.none),
//       ),
//     );
//   }
//
// }
