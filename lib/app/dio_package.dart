import 'package:flutter/material.dart';
import 'package:i_tech/screens/products_screen.dart';

class DioPackage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dio Package',

      debugShowCheckedModeBanner: false,
      home: ProductsScreen(),
    );
  }
}
