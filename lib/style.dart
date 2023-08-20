import 'package:flutter/material.dart';

InputDecoration myStyle(String myText) {
  return InputDecoration(
      fillColor: Colors.white,
      filled: true,
      border: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
            color: Color.fromARGB(227, 159, 2, 171), style: BorderStyle.solid),
      ),
      hintText: myText);
}

ButtonStyle myDesign() {
  return ElevatedButton.styleFrom(
      minimumSize: const Size(double.infinity, 50),
      backgroundColor: Colors.purple.shade500,
      elevation: 10);
}

TextStyle myText() {
  return const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold
  );
}
