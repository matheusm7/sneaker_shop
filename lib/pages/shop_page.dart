import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/shoe.dart';

import '../components/shoe_tile.dart';
import '../models/cart.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  // add shoe to cart
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);

    // alert the user, shoe sucessfully added
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              title: Text('Sucessfully added!'),
              content: Text('Check your cart'),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Column(
              children: [
                // search bar
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.symmetric(horizontal: 25),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Search', style: TextStyle(color: Colors.grey)),
                      Icon(Icons.search, color: Colors.grey),
                    ],
                  ),
                ),
                // message
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25),
                  child: Text(
                    'Everyone flies, some fly longer than others',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                ),
                // hot picks

                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Hot Picks',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                      Text(
                        'See all',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 5),

                // list of shoes for sale
                Expanded(
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      Shoe shoe = value.getShoesList()[index];
                      return ShoeTile(
                        shoe: shoe,
                        onTap: () => addShoeToCart(shoe),
                      );
                    },
                  ),
                ),
                const Padding(padding: EdgeInsets.only(top: 25, left: 25, right: 25))
              ],
            ));
  }
}
