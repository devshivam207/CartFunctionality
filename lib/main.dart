import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:restaurant/homepage.dart';

import 'cartpage.dart';
import 'controller/cartcontroller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    //important
    Get.lazyPut(() => CartController());

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData(brightness: Brightness.dark),
      getPages: [
        GetPage(name: "/", page: () => MyHomePage()),
        GetPage(name: "/cart", page: () => MyCartPage()),
      ],
      home: MyHomePage(),
    );
  }
}
