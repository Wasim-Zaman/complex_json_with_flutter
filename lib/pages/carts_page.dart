import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/data_model.dart';
import '../widgets/cart_item.dart';

class CartsPage extends StatelessWidget {
  const CartsPage({super.key});

  static const pageName = '/cart-page';

  @override
  Widget build(BuildContext context) {
    final usersData = Provider.of<DataModel>(context, listen: false).usersData;

    final productsData =
        Provider.of<DataModel>(context, listen: false).productsData;

    final cartsData = Provider.of<DataModel>(context, listen: false).cartsData;

    return SingleChildScrollView(
      child: Column(
        children: cartsData.map((cart) {
          final userIdInCart = cart['userId'];

          /* ########################## User ############################*/

          // grab the user from the usersData list
          final userCart =
              usersData.firstWhere((user) => user['id'] == userIdInCart);
          final userAdd = userCart['address'] as Map<String, Object>;
          final userName = userCart['name'] as Map<String, String>;

          /* ######################## Products ############################*/

          // grab the products from the productsData list
          final productsInCart = cart['products'] as List<Map<String, Object>>;

          return Column(
            children: [
              ListTile(
                title: Text(
                  "${userName['firstname']} ${userName['lastname']}",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                subtitle: Text(
                  userCart['email'].toString(),
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
                trailing: Chip(
                  label: Text(
                    "City: ${userAdd['city']}",
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  backgroundColor: Theme.of(context).primaryColorLight,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 30,
                ),
                height: 300,
                // width: double.infinity,
                color: Colors.grey[300],
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    // childAspectRatio: 2 / 3,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final prodIdInCart = productsInCart[index]['productId'];
                    final prodQtyInCart =
                        productsInCart[index]['quantity'] as int;

                    final productInCart = productsData
                        .firstWhere((product) => product['id'] == prodIdInCart);

                    return CartItemHorizontal(
                      cartImageUrl: productInCart['image'].toString(),
                      cartProductPrice: productInCart['price'].toString(),
                      cartProductQuantity: prodQtyInCart,
                      cartProductTitle: productInCart['title'].toString(),
                    );
                  },
                  itemCount: productsInCart.length,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
