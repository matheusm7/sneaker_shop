import 'package:flutter/material.dart';
import 'package:sneaker_shop/components/bottom_nav_bar.dart';

import 'cart_page.dart';
import 'shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // this selectedIndex is to control the NavBar
  int _selectedIndex = 0;

  // this method will update our selected index
  // when the user taps on the bottom bar
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // pages to display
  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Padding(
                padding: EdgeInsets.only(left: 12),
                child: Icon(Icons.menu, color: Colors.black),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          )),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                // logo
                Container(
                  height: 200,
                  padding: const EdgeInsets.only(top: 25),
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 70),
                          child: Image.asset(
                            'lib/images/nike.png',
                            color: Colors.white,
                            width: 150,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Divider(
                    color: Colors.grey[800],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                    title: Text(
                      'Home',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: ListTile(
                    leading: Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    title: Text(
                      'About',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25, bottom: 25),
              child: ListTile(
                leading: Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyButtonNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
