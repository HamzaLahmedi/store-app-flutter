import 'package:flutter/material.dart';
import 'package:store_app/screens/home_page.dart';
import 'package:store_app/screens/update_product_page.dart';

void main() {
  runApp(const Store_App());
}

class Store_App extends StatelessWidget {
  const Store_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomePage.id:(context)=>HomePage(),
        UpdateProductPage.id:(context)=>UpdateProductPage()
      },
      initialRoute: HomePage.id,

    );
  }
}

