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
              Card(
                margin: const EdgeInsets.all(10),
                child: ListTile(
                  title:
                      Text("${userName['firstname']} ${userName['lastname']}"),
                  subtitle: Text(userCart['email'].toString()),
                  trailing: Text("City: ${userAdd['city']}"),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                  bottom: 30,
                ),
                height: 200,
                color: Colors.grey[300],
                child: ListView.builder(
                  itemCount: productsInCart.length,
                  itemBuilder: (context, index) {
                    final prodIdInCart = productsInCart[index]['productId'];
                    final prodQtyInCart =
                        productsInCart[index]['quantity'] as int;

                    final productInCart = productsData
                        .firstWhere((product) => product['id'] == prodIdInCart);

                    return CartItem(
                      cartImageUrl: productsInCart[index]['image'].toString(),
                      cartProductPrice: productInCart['price'].toString(),
                      cartProductQuantity: prodQtyInCart,
                      cartProductTitle: productInCart['title'].toString(),
                    );
                  },
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
