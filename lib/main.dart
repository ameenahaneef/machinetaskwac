import 'dart:io';

import 'package:flutter/material.dart';
import 'package:machinetask_wac/viewmodels/betseller_provider.dart';
import 'package:machinetask_wac/viewmodels/bottom_nav_provider.dart';
import 'package:machinetask_wac/viewmodels/category_provider.dart';
import 'package:machinetask_wac/viewmodels/most_popularpro.dart';
import 'package:machinetask_wac/viewmodels/singlebanner.dart';
import 'package:machinetask_wac/viewmodels/slider_banner_provider.dart';
import 'package:machinetask_wac/views/home.dart';
import 'package:provider/provider.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavProvider()),
        ChangeNotifierProvider(
          create: (context) => BannerSliderProvider(),
        ),
        ChangeNotifierProvider(
            create: (context) => MostPopularProductsProvider()),
        ChangeNotifierProvider(create: (context) => SingleBannerProvider()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => BestSellersProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
