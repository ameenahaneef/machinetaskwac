import 'package:flutter/material.dart';
import 'package:machinetask_wac/constants/others_constants.dart';
import 'package:machinetask_wac/viewmodels/category_provider.dart';
import 'package:provider/provider.dart';

class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Consumer<CategoryProvider>(
        builder: (context, categoryProvider, child) {
          if (categoryProvider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (categoryProvider.categories.isEmpty) {
            return const Center(
                child: Text('No categories available'));
          }
    
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryProvider.categories.length,
            itemBuilder: (context, index) {
              final category = categoryProvider.categories[index];
              return Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black)),
                width: 110,
                margin: const EdgeInsets.all(3),
                child: Column(
                  children: [
                    Image.network(
                      category.imageUrl,
                      fit: BoxFit.cover,
                      height: 70,
                    ),
                    kheight5,
                    Text(
                      category.title,
                      style: style1,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
