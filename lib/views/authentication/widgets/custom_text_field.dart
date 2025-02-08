import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String labelText;
  const CustomTextField(
      {super.key, required this.title, required this.labelText});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Text(labelText),
TextField(
  decoration: InputDecoration(
    filled: true,
    fillColor: Colors.grey[300], // Light grey background
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0), // Rounded corners
      borderSide: BorderSide.none, // Removes the default border
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
  ),
)      ],
    );
  }
}
