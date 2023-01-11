// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.text, this.ontap, this.colour});

  final String? text;
  final VoidCallback? ontap;
  final Color? colour;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: ontap,
          minWidth: 200.0,
          height: 42.0,
          child: Text(text!),
        ),
      ),
    );
  }
}
