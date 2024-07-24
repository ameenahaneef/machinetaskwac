import 'package:flutter/material.dart';
import 'package:machinetask_wac/viewmodels/bottom_nav_provider.dart';
import 'package:machinetask_wac/viewmodels/slider_banner_provider.dart';
import 'package:machinetask_wac/views/home.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
      ChangeNotifierProvider(
        create: (context)=> BottomNavProvider()),
        ChangeNotifierProvider(create:(context) => BannerProvider(),)
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
