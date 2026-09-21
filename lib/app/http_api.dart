import 'package:flutter/material.dart';
import 'package:i_tech/screens/api_screen.dart';

class HttpApi extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: ApiScreen());
  }
}
