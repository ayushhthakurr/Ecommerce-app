import 'package:flutter/material.dart';

class CategoryButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String selected;

  CategoryButton({required this.text, required this.onPressed, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(

            backgroundColor: text == selected?Colors.black: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: onPressed,
          child: Text(text, style: TextStyle(color: text == selected?Colors.white: Colors.black)
          ),
        ),
      ),
    );
  }
}
