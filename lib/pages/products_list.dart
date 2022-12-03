import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/data_model.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  static const pageName = '/products-list';

  @override
  Widget build(BuildContext context) {
    final productsData =
        Provider.of<DataModel>(context, listen: false).productsData;

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
                footer: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Theme.of(context).primaryColor,
                        child: FittedBox(
                          child: Text(
                            "\$ ${productsData[index]['price']}".toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                child: SizedBox(
                  height: 100,
                  child: Card(
                    margin: const EdgeInsets.all(10),
                    child: Image.network(
                      productsData[index]['image'].toString(),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
