import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:machinetask_wac/constants/others_constants.dart';
import 'package:machinetask_wac/viewmodels/slider_banner_provider.dart';
import 'package:machinetask_wac/views/home/widget/itemwidget.dart';
import 'package:machinetask_wac/views/home/widget/textfield.dart';
import 'package:provider/provider.dart';
import 'package:machinetask_wac/constants/colors.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final bannerProvider = Provider.of<BannerProvider>(context);

    if (bannerProvider.bannerSliders == null && !bannerProvider.isLoading) {
      bannerProvider.fetchBannerData();
    }

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
      body: bannerProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : bannerProvider.bannerSliders != null
              ? SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        items: bannerProvider.bannerSliders!
                            .expand((slider) => slider.contents)
                            .map((content) => Builder(
                                  builder: (BuildContext context) {
                                    return Container(
                                      width: MediaQuery.of(context).size.width,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 5.0),
                                      child: Image.network(
                                        content.imageUrl,
                                        fit: BoxFit.cover,
                                      ),
                                    );
                                  },
                                ))
                            .toList(),
                        options: CarouselOptions(
                          height: 130,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Most Popular',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                            Text(
                              'View all',
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return buildItem();
                          },
                        ),
                      ),
                      kheight10,
                      SizedBox(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset('assets/1413908.png'),
                      ),
                      kheight10,
                      SizedBox(
                        height: 200,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return buildItem();
                          },
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(child: Text('Failed to load data')),
    );
  }
}
