 import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:machinetask_wac/constants/colors.dart';

Widget buildItem() {
    return Container(
      width: 120,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Center(
            child: Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/1413908.png'),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 30,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.orange,
              ),
            ),
          ),
          const Text('sdsfdsfdfdfdfghgh'),
          RatingBar(
            filledIcon: Icons.star,
            emptyIcon: Icons.star_border,
            onRatingChanged: (value) => debugPrint('$value'),
            initialRating: 3,
            maxRating: 5,
            size: 15,
          ),
        ],
      ),
    );
  }