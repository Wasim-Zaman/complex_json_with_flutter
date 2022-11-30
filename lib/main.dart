import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'pages/users_list.dart';
import 'pages/products_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Complex json",
      // home: const HomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        UsersList.pageName: (context) => const UsersList(),
        ProductsList.pageName: (context) => const ProductsList(),
      },
    );
  }
}
