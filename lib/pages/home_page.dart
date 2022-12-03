import "package:flutter/material.dart";

import "../pages/products_list.dart";
import "../pages/users_list.dart";
import "../pages/carts_page.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // Instead of that we also need the list of the pages.
  List<Map<String, dynamic>>? _pages;

  @override
  void initState() {
    _pages = [
      // As we will be having two tabs,
      // thats is why we need two widgets here

      {
        "page": const UsersList(),
        "title": "Users Data",
      },
      {
        "page": const ProductsList(),
        "title": "Products Data",
      },
      {
        "page": CartsPage(),
        "title": "User Carts",
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages![_selectedIndex]['title']),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: _pages![_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        // What if we press one of the two tabs
        onTap: (value) {
          setState(() {
            // We should change the index
            // so that we can switch tab using index
            _selectedIndex = value;
          });
        },

        // Some styling to the tabs
        backgroundColor: Theme.of(context).primaryColor,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black,
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColor,
        iconSize: 30,

        // Setting the type
        type: BottomNavigationBarType.shifting,

        // Feeding the items (two items into the BottomNavigationBar)
        items: const [
          // this property need the BottomNavigationBarItem as element
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Users Data",
            tooltip: "Users Data",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_object),
            label: "Products Data",
            tooltip: "Products Data",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "User Carts",
            tooltip: "User Carts",
          ),
        ],
      ),
    );
  }
}
