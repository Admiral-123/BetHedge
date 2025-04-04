import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatefulWidget {
  final TextEditingController controller;
  final double padding;
  final RegExp? regex;

  const MyTextField({
    super.key,
    required this.controller,
    required this.padding,
    this.regex,
  });

  @override
  State<MyTextField> createState() => MyTextFieldState();
}

class MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(widget.padding),
      child: TextField(
        controller: widget.controller,
        inputFormatters: [FilteringTextInputFormatter.allow(widget.regex!)],
      ),
    );
  }
}
