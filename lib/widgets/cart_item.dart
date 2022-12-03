import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String cartImageUrl;
  final double cartProductPrice;
  final int cartProductQuantity;

  final String cartProductTitle;

  const CartItem({
    required this.cartImageUrl,
    required this.cartProductPrice,
    required this.cartProductQuantity,
    required this.cartProductTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            cartImageUrl,
          ),
        ),
        title: Text(cartProductTitle),
        subtitle: Text("Quantity: $cartProductQuantity x"),
        trailing: Column(
          children: [
            Text("Price: \$$cartProductPrice"),
            Text(
                "Total: \$${cartProductPrice * cartProductQuantity}"), // total price
          ],
        ),
      ),
    );
  }
}
