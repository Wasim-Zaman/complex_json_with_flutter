import 'package:flutter/material.dart';

import "../json/products_data.dart";
import "../json/users_data.dart";
import "../json/carts_data.dart";

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  static const pageName = '/products-list';

  @override
  Widget build(BuildContext context) {
    final productsData = products;
    final usersData = users;
    final cartsData = carts;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: usersData.length,
            itemBuilder: (context, index) {
              final userName = usersData[index]['name'] as Map<String, String>;
              final userAddress =
                  usersData[index]['address'] as Map<String, Object>;
              return Card(
                elevation: 6,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                      productsData[index]['image'].toString(),
                    ),
                  ),
                  title:
                      Text("${userName['firstname']} ${userName['lastname']}"),
                  subtitle: Text(usersData[index]['email'].toString()),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
