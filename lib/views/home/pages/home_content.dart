import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:machinetask_wac/viewmodels/betseller_provider.dart';
import 'package:machinetask_wac/viewmodels/category_provider.dart';
import 'package:machinetask_wac/viewmodels/most_popularpro.dart';
import 'package:machinetask_wac/viewmodels/singlebanner.dart';
import 'package:machinetask_wac/views/home/widget/category.dart';
import 'package:machinetask_wac/views/home/widget/most_popular.dart';
import 'package:machinetask_wac/views/home/widget/row_widget.dart';
import 'package:provider/provider.dart';
import 'package:machinetask_wac/constants/colors.dart';
import 'package:machinetask_wac/constants/others_constants.dart';
import 'package:machinetask_wac/viewmodels/slider_banner_provider.dart';
import 'package:machinetask_wac/views/home/widget/itemwidget.dart';
import 'package:machinetask_wac/views/home/widget/textfield.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<BannerSliderProvider>(context, listen: false)
          .fetchBannerSliders();
      Provider.of<MostPopularProductsProvider>(context, listen: false)
          .fetchMostPopularProducts();
      Provider.of<SingleBannerProvider>(context, listen: false)
          .fetchSingleBanner();
      Provider.of<CategoryProvider>(context, listen: false).fetchCategories();
      Provider.of<BestSellersProvider>(context, listen: false)
          .fetchBestSellersProducts();
    });

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGreen,
        leading: const Padding(
          padding: EdgeInsets.only(left: 28.0),
          child: Image(image: AssetImage('assets/1413908.png')),
        ),
        title: const SizedBox(
          width: 240,
          height: 30,
          child: Textfield(),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 28.0),
            child: Icon(
              Icons.notifications,
              color: kwhite,
            ),
          ),
        ],
      ),
      body: Consumer5<BannerSliderProvider, MostPopularProductsProvider,
          SingleBannerProvider, CategoryProvider, BestSellersProvider>(
        builder: (context,
            bannerProvider,
            popularProvider,
            singleBannerProvider,
            categoryProvider,
            bestSellersProvider,
            child) {
          return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left:8.0,right: 8),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  CarouselSlider(
                    items: bannerProvider.bannerSliders
                        .map((content) => Builder(
                              builder: (BuildContext context) {
                                return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Image.network(
                                    content.imageUrl,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Center(
                                          child: Icon(Icons.error,
                                              color: Colors.red));
                                    },
                                  ),
                                );
                              },
                            ))
                        .toList(),
                    options: CarouselOptions(
                      height: 130,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      enableInfiniteScroll: true,
                      viewportFraction: 1.0,
                    ),
                  ),
                  RowWidget(
                    text1: 'Most Popular',
                    text2: 'View all',
                  ),
                  const MostPopular(),
                  kheight10,
                  if (singleBannerProvider.singleBanner != null)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: SizedBox(
                        height: 110,
                        width: MediaQuery.of(context).size.width,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.network(
                            singleBannerProvider.singleBanner!.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return const Center(
                                  child: Icon(Icons.error, color: Colors.red));
                            },
                          ),
                        ),
                      ),
                    ),
                  kheight10,
                  RowWidget(text1: 'Categories', text2: 'View all'),
                  const Categories(),
                  kheight10,
                  RowWidget(text1: 'Featured Products', text2: 'View all'),
                  SizedBox(
                      height: 250,
                      child: Consumer<BestSellersProvider>(
                        builder: (context, bestSellersProvider, child) {
                          if (bestSellersProvider.bestSellersProduct.isEmpty) {
                            return const Center(
                                child: Text('No best sellers available'));
                          }
                
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount:
                                bestSellersProvider.bestSellersProduct.length,
                            itemBuilder: (context, index) {
                              final product =
                                  bestSellersProvider.bestSellersProduct[index];
                
                              return buildItem(product);
                            },
                          );
                        },
                      )),
                ]),
              ));
        },
      ),
    );
  }
}

