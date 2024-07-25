//  import 'package:custom_rating_bar/custom_rating_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:machinetask_wac/constants/colors.dart';
// import 'package:machinetask_wac/models/most_popular.dart';

// Widget buildItem(Product product) {
//     return Container(
//       width: 150,
//       margin: const EdgeInsets.symmetric(horizontal: 4.0),
//       decoration: BoxDecoration(
//         color: kwhite,
//         borderRadius: BorderRadius.circular(8.0),
//         border: Border.all(color: Colors.black, width: 1.0),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Center(
//               child: Container(
//                 width:100,
//                 height: 100,
//                 decoration:  BoxDecoration(
//                   image: DecorationImage(
//                     image: NetworkImage(product.productImage),
//                   ),
//                 ),
//               ),
//             ),
//             Align(
//               alignment: Alignment.bottomLeft,
//               child: Container(
//                 height: 30,
//                 width: 80,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(10),
//                   color: Colors.orange,
//                 ),
//                 child:  Text('sss',style: TextStyle(overflow: TextOverflow.ellipsis),),
//               ),
//             ),
//              Text(product.sku,style: TextStyle(overflow: TextOverflow.ellipsis),),
//             RatingBar(
//               filledIcon: Icons.star,
//               emptyIcon: Icons.star_border,
//               onRatingChanged: (value) => debugPrint('$value'),
//               initialRating: product.productRating.toDouble(),
//               maxRating: 5,
//               size: 15,
//             ),
//              Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               children: [
//                 Text(
//                   product.offerPrice, // Display offer price
//                   style: const TextStyle(fontSize: 12, color: Colors.green),
//                 ),
//                 //SizedBox(width: 2,),
//                 Text(
//                   product.actualPrice, // Display offer price
//                   style: const TextStyle(fontSize: 12, color: Colors.green),
//                 ),
//               ],
//             ),
//           ),
//           ],
//         ),
//       ),
//     );
//   }