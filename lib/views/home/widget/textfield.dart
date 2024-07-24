
import 'package:flutter/material.dart';
import 'package:machinetask_wac/constants/colors.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: kwhite,
        suffixIcon: const Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
