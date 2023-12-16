import 'package:flutter/material.dart';

class TextFieldProfile extends StatelessWidget {
  const TextFieldProfile({
    Key? key,
    required this.text,
    this.controllerText,
    this.obscureText,
    this.isEnabled = true,
  }) : super(key: key);

  final String text;
  final TextEditingController? controllerText;
  final bool? obscureText;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controllerText,
        obscureText: obscureText ?? false,
        enabled: isEnabled, 
        decoration: InputDecoration(
          labelText: text,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        ),
      ),
    );
  }
}
