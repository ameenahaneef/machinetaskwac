import 'package:flutter/material.dart';

class RowWidget extends StatelessWidget {
  String text1;
  String text2;
   RowWidget({
    required this.text1,
    required this.text2,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
           text1,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            text2,
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
