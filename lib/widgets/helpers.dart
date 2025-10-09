import 'package:flutter/material.dart';

Widget buildLabel(String text) => Text(text, style: const TextStyle(fontSize: 16));

Widget buildButton(VoidCallback onPressed, String label) {
  return ElevatedButton(onPressed: onPressed, child: Text(label));
}

