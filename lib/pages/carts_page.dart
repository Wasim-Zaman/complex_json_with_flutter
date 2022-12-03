import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';

import '../models/data_model.dart';

class CartsPage extends StatelessWidget {
  CartsPage({super.key});

  static const pageName = '/cart-page';
  var userCart;
  var prodsInCart;

  @override
  Widget build(BuildContext context) {
    final usersData = Provider.of<DataModel>(context, listen: false).usersData;

    final productsData =
        Provider.of<DataModel>(context, listen: false).productsData;

    final cartsData = Provider.of<DataModel>(context, listen: false).cartsData;

    final usersInCart = Provider.of<DataModel>(context, listen: false).UIC;
    final productsInCart = Provider.of<DataModel>(context, listen: false).PIC;

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
              // const SizedBox(height: 10),
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

                    return Card(
                      borderOnForeground: true,
                      elevation: 6,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 8,
                      ),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(
                            productInCart['image'].toString(),
                          ),
                        ),
                        title: Text(productInCart['title'].toString()),
                        subtitle: Text("Quantity: $prodQtyInCart x"),
                        trailing: Column(
                          children: [
                            Text("Price: \$${productInCart['price']}"),
                            // Text(
                            //     "Total: \$${productInCart['price'] * prodQtyInCart}"),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );

    // return Column(
    //   children: [
    //     Expanded(
    //       child: ListView.builder(
    //         itemBuilder: (context, index) {
    //           /* ####################### User ############################# */

    //           final userId = cartsData[index]['userId'];
    //           final cartUser =
    //               cartsData.where((cart) => cart['userId'] == userId).toList();

    //           print(cartUser);

    //           return SingleChildScrollView(
    //             child: Column(
    //               children: [
    //                 InkWell(
    //                   onTap: () {
    //                     Navigator.of(context).pushNamed(UserCartPage.pageName);
    //                   },
    //                   splashColor: Theme.of(context).primaryColor,
    //                   child: Card(
    //                     margin: const EdgeInsets.all(10),
    //                     elevation: 6,
    //                     child: Text(cartUser.toString()),
    //                     // child: ListTile(
    //                     //   title: Text(
    //                     //     'User Name: ${userName["firstname"]} ${userName["lastname"]}',
    //                     //   ),
    //                     //   subtitle: Text('Email: ${user["email"]}'),
    //                     //   trailing: Text("City: ${userAddress['city']}"),
    //                     // ),
    //                   ),
    //                 ),
    //                 // Container(
    //                 //   // width: double.infinity,
    //                 //   height: 200,
    //                 //   color: Colors.amber,
    //                 //   child: Expanded(
    //                 //     child: ListView.builder(
    //                 //       itemCount: productsInCart.length,
    //                 //       scrollDirection: Axis.horizontal,
    //                 //       itemBuilder: (ctx, m) => Card(
    //                 //         child: Text("$m"),
    //                 //       ),
    //                 //     ),
    //                 //   ),
    //                 // )
    //               ],
    //             ),
    //           );
    //         },
    //         itemCount: cartsData.length,
    //       ),
    //     ),
    //   ],
    // );
  }
}
