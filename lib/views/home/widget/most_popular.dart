import 'package:flutter/material.dart';
import 'package:machinetask_wac/viewmodels/most_popularpro.dart';
import 'package:machinetask_wac/views/home/widget/itemwidget.dart';
import 'package:provider/provider.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Consumer<MostPopularProductsProvider>(
        builder: (context, popularProvider, child) {
          if (popularProvider.mostPopularProducts.isEmpty) {
            return const Center(
                child: Text('No popular products available'));
          }
    
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: popularProvider.mostPopularProducts.length,
            itemBuilder: (context, index) {
              final product =
                  popularProvider.mostPopularProducts[index];
              return buildItem(product);
            },
          );
        },
      ),
    );
  }
}

