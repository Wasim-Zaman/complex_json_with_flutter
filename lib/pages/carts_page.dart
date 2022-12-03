import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/data_model.dart';

class CartsPage extends StatelessWidget {
  CartsPage({super.key});

  static const pageName = '/cart-page';

  @override
  Widget build(BuildContext context) {
    final usersData = Provider.of<DataModel>(context, listen: false).usersData;

    final productsData =
        Provider.of<DataModel>(context, listen: false).productsData;

    final cartsData = Provider.of<DataModel>(context, listen: false).cartsData;

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              /* ####################### User ############################# */

              final user = usersData[index];
              final userName = user['name'] as Map<String, String>;
              final userAddress = user['address'] as Map<String, Object>;

              /* ####################### Cart ############################# */

              // grab the matched user id carts from the carts data
              final matchedIdCarts = [];
              cartsData.forEach(
                (cart) {
                  matchedIdCarts.add(cart);
                },
              );

              final usersInCart = [];
              final productsInCart = [];
              matchedIdCarts.forEach((cart) {
                usersData.forEach((user) {
                  if (user['id'] == cart['userId']) {
                    usersInCart.add(user);
                  }
                });

                cart['products'].forEach((prodInCart) {
                  productsInCart.add(prodInCart);
                  productsData.forEach((product) {
                    if (prodInCart['productId'] == product['id']) {
                      productsInCart.add(product);
                    }
                  });
                });
              });

              return SingleChildScrollView(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {},
                      splashColor: Theme.of(context).primaryColor,
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        elevation: 6,
                        child: ListTile(
                          title: Text(
                            'User Name: ${userName["firstname"]} ${userName["lastname"]}',
                          ),
                          subtitle: Text('Email: ${user["email"]}'),
                          trailing: Text("City: ${userAddress['city']}"),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: usersData.length,
          ),
        ),
      ],
    );
  }
}
