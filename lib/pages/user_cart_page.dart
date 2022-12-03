import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/data_model.dart';

class UserCartPage extends StatelessWidget {
  const UserCartPage({super.key});

  static const pageName = '/user-cart-page';

  @override
  Widget build(BuildContext context) {
    final usersInCart = Provider.of<DataModel>(context, listen: false).UIC;
    final productsInCart = Provider.of<DataModel>(context, listen: false).PIC;
    return Scaffold(
      appBar: AppBar(
        title: Text("User Carts"),
      ),
    );
  }
}
