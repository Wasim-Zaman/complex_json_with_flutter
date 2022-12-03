import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/users_list.dart';
import 'pages/home_page.dart';
import 'pages/products_list.dart';
import 'pages/carts_page.dart';

import './models/data_model.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Complex json",
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        // home: const HomePage(),
        initialRoute: '/',
        routes: {
          '/': (context) => const HomePage(),
          UsersList.pageName: (context) => const UsersList(),
          // ignore: equal_keys_in_map
          ProductsList.pageName: (context) => const ProductsList(),
          CartsPage.pageName: (context) => CartsPage(),
        },
      ),
    );
  }
}
