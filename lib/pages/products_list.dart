import 'package:flutter/material.dart';

import "../json/products_data.dart";
import "../json/users_data.dart";
import "../json/carts_data.dart";

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  static const pageName = '/products-list';

  @override
  Widget build(BuildContext context) {
    final productsData = products;
    final usersData = users;
    final cartsData = carts;

    return Column(
      children: [
        Expanded(
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              // childAspectRatio: 3 / 2,
              // crossAxisSpacing: 10,
              mainAxisSpacing: 20,
            ),
            itemCount: productsData.length,
            itemBuilder: (context, index) {
              return GridTile(
                header: GridTileBar(
                  title: Text(
                    productsData[index]['title'].toString(),
                    softWrap: true,
                  ),
                  backgroundColor: Colors.black54,
                ),
                footer: GridTileBar(
                  title: Text(
                    "\$${productsData[index]['price']}".toString(),
                  ),
                  backgroundColor: Colors.black54,
                  // trailing: Text(productsData[index]['']),
                ),
                child: Image.network(
                  productsData[index]['image'].toString(),
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
