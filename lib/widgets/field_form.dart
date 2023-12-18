import 'package:flutter/material.dart';

class FieldForm extends StatelessWidget {
  final String label;
  final bool isPassword;
  final TextEditingController controller;
  final bool isForm;
  final bool isEmail;

  const FieldForm(
      {required this.label,
      required this.isPassword,
      required this.controller,
      required this.isForm,
      required this.isEmail,
      super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isForm,
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        labelText: label,
      ),
      validator: (value) {
        if (value!.length < 5) {
          return "Digite pelo menos 5 caracteres.";
        }

        if (isEmail && !value.contains("@")) {
          return "Digite um e-mail válido.";
        }
        return null;
      },
    );
  }
}
