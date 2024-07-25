 import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:machinetask_wac/constants/colors.dart';
import 'package:machinetask_wac/constants/others_constants.dart';
import 'package:machinetask_wac/models/most_popular.dart';

Widget buildItem(Product product) {
   bool showOfferPrice = product.offerPrice != product.actualPrice;
  bool showOffer = product.discount.isNotEmpty;
    return Container(
      width: 160,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        color: kwhite,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: Colors.black, width: 1.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Center(
              child: Container(
                width:100,
                height: 100,
                decoration:  BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.productImage),
                  ),
                ),
              ),
            ),
            if(showOffer)
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                height: 30,
                width: 80,
                
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:  const Color.fromRGBO(213, 106, 68, 1),
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text('${product.discount} off',style: const TextStyle(overflow: TextOverflow.ellipsis),),
                ),
              ),
            ),
             Text(product.productName,style: const TextStyle(overflow: TextOverflow.ellipsis),),
            RatingBar(
              filledIcon: Icons.star,
              emptyIcon: Icons.star_border,
              onRatingChanged: (value) => debugPrint('$value'),
              initialRating: product.productRating.toDouble(),
              maxRating: 5,
              size: 15,
            ),
             Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                if(showOfferPrice)
                Text(
                  product.offerPrice, 
                  style: const TextStyle(fontSize: 12, color: Colors.black),
                ),
                kwidth2,
                Text(
                  product.actualPrice, 
                  style: const TextStyle(fontSize: 12, color: Colors.grey,
                  decoration: TextDecoration.lineThrough
                  ),
                ),
              ],
            ),
          ),
          ],
        ),
      ),
    );
  }