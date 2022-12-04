import 'package:flutter/material.dart';

class CartItemHorizontal extends StatelessWidget {
  final String cartImageUrl;
  final String cartProductPrice;
  final int cartProductQuantity;
  final String cartProductTitle;
  const CartItemHorizontal({
    super.key,
    required this.cartImageUrl,
    required this.cartProductPrice,
    required this.cartProductQuantity,
    required this.cartProductTitle,
  });

  @override
  Widget build(BuildContext context) {
    // print(cartImageUrl);
    return GridTile(
      header: GridTileBar(
        backgroundColor: Colors.black54,
        title: Text(
          cartProductTitle,
          textAlign: TextAlign.center,
        ),
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Price"),
                Text("\$$cartProductPrice"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Quantity"),
                Text("$cartProductQuantity"),
              ],
            ),
            Column(
              children: [
                const Text("Total"),
                Text(
                    "\$${double.parse(cartProductPrice) * cartProductQuantity}"),
              ],
            ),
          ],
        ),
      ),
      child: Card(
        elevation: 5,
        child: Image.network(
          cartImageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return const Center(
              child: Text("Image not found !"),
            );
          },
        ),
      ),
    );
  }
}
