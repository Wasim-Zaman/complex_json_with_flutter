import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/data_model.dart';

class UsersList extends StatelessWidget {
  const UsersList({super.key});

  static const pageName = '/products-list';

  @override
  Widget build(BuildContext context) {
    final usersData = Provider.of<DataModel>(context, listen: false).usersData;

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
                margin: const EdgeInsets.all(10),
                elevation: 6,
                child: ListTile(
                  title: Text(
                    "${userName['firstname']} ${userName['lastname']}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(usersData[index]['email'].toString()),
                  trailing: Text(
                    "City: ${userAddress['city']}",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
