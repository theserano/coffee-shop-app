import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/data/providers/coffee_order.dart';
import 'package:coffee_shop_app/ui/components/bottom_nav.dart';
import 'package:coffee_shop_app/ui/components/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool checkIfCartIsEmpty() {
    if (Provider.of<Coffee>(context, listen: false).orders.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Widget showCoffeeOrders(BuildContext context) {
    final coffeeOrders = Provider.of<Coffee>(context).orders;

    if (coffeeOrders.isEmpty) {
      return Container();
    }

    return Column(
      children: coffeeOrders.map((item) {
        return CartItem(coffee: item);
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColors?.background,
        elevation: 5,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          iconSize: 23,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BottomNav(
                          pageIndex: 2,
                        )));
          },
        ),
        title: const Text(
          'Shopping cart',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: [
          checkIfCartIsEmpty() ?  Container() : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {
                  // Use Provider.of with listen: false inside the event handler
                  Provider.of<Coffee>(context, listen: false).clearOrder();
                },
                icon: const Icon(Icons.remove_shopping_cart_rounded),
              )
            ],
          ),
        ],
      ),
      backgroundColor: customColors?.background,
      body: checkIfCartIsEmpty()
          ? Center(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: const EdgeInsets.only(top: 50, bottom: 50, left: 70, right: 70),
                      decoration: BoxDecoration(
                        color: customColors?.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.remove_shopping_cart_rounded, size: 50, color: Colors.black38,),
                            SizedBox(height: 10,),
                            Text('No item in your cart', style: TextStyle(color: Colors.black54, fontSize: 16),),
                          ],
                        ),
                    ),
                  ),
                ),
              ],
            ),
          )
          : SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                showCoffeeOrders(context),

                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      const Text('Total Price', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),),
                      const Spacer(),
                      Text(' \$${Provider.of<Coffee>(context, listen: false).getTotalPrice()}', style: const TextStyle(fontSize: 18),),
                    ],
                  ),
                ),
                Center(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: customColors?.green,
                      borderRadius: BorderRadius.circular(8)),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNav(pageIndex: 1,)));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Add to cart', style: TextStyle(fontSize: 20, color: customColors?.white, fontWeight: FontWeight.w400),),
                      ],
                    ),
                  )),
            ),
              ],
            ),
          ),
    );
  }
}
