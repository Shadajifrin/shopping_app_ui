import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app_ui/model/cartmodel.dart';
import 'package:shopping_app_ui/screens/categoryscreen.dart';
import 'package:shopping_app_ui/screens/detailpage.dart';
import 'package:shopping_app_ui/screens/homescreen.dart';
import 'package:shopping_app_ui/screens/laptopscreen.dart';
import 'package:shopping_app_ui/screens/iphonescreen.dart';
import 'package:shopping_app_ui/screens/cartscreen.dart';



void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
      routes: {
        '/categories': (context) => CategoriesScreen(),
        '/laptops': (context) => LaptopScreen(),
        '/iphones': (context) => IphonesScreen(),
        '/product_detail': (context) => ProductDetailScreen(),
        '/cart': (context) => CartScreen(),
      },
    );
  }
}
