import 'package:flutter/material.dart';

Widget textFieldDesign({
  required String label,
  required String hint,
  required TextEditingController controller,
}) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      labelStyle: TextStyle(color: Colors.red[500], fontSize: 20),
      contentPadding: const EdgeInsets.all(20),
      hintText: hint,
      labelText: label,
      filled: true,
      hoverColor: Colors.blue.shade100,
      border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
          borderSide: BorderSide.none),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        borderSide: BorderSide(
          color: Colors.blue.shade800,
          width: 2.0,
        ),
      ),
    ),
  );
}
