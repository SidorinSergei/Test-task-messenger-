import 'package:flutter/material.dart';
import 'view/page/home_page.dart'; // Укажите правильный путь к вашей странице

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}
