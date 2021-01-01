import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController textEditingController;
  final Widget prefixIcon;
  final String labelText;
  final TextInputType textInputType;
  final bool obscure;
  final String Function(String) validator;

  InputField(
      {this.textEditingController,
      this.labelText,
      this.prefixIcon,
      this.textInputType,
      this.validator,
      obscure})
      : obscure = obscure ?? false;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 50,
        child: TextFormField(
          autocorrect: false,
          obscureText: obscure,
          controller: textEditingController,
          validator: validator,
          keyboardType: textInputType,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
              prefixIcon: prefixIcon,
              labelText: labelText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.teal[50]))),
        ));
  }
}
