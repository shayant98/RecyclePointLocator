import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final bool autofocus;
  final String hint;
  final String label;
  final bool isPassword;

  InputField({
    required this.controller,
    required this.inputType,
    this.autofocus = false,
    required this.hint,
    required this.label,
    required this.isPassword,
  });

  @override
  _InputFieldState createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _showPassword = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      // validator: (val) => widget.validator(val),
      keyboardType: widget.inputType,
      autofocus: widget.autofocus,
      obscureText: (widget.isPassword == true)
          ? _showPassword
              ? false
              : true
          : false,
      decoration: InputDecoration(
        labelText: tr(widget.label),
        hintText: tr(widget.hint),
        fillColor: Colors.white,
        suffixIcon: (widget.isPassword == true)
            ? (_showPassword
                ? IconButton(
                    icon: Icon(Icons.remove_red_eye),
                    onPressed: () {
                      togglePassword();
                    })
                : IconButton(
                    icon: Icon(Icons.remove_red_eye_outlined),
                    onPressed: () {
                      togglePassword();
                    }))
            : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(),
        ),
      ),
    );
  }

  void togglePassword() {
    setState(() {
      _showPassword = !_showPassword;
    });
  }
}
