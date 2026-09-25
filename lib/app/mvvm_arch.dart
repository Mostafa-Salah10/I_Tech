import 'package:flutter/material.dart';
import 'package:i_tech/presentation/screens/products_screen.dart';

class MvvmArch extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "MVVM Arch",
      debugShowCheckedModeBanner: false,
      home: ProductsScreen(),
    );
  }
}
