import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/data/models/drinks.dart';
import 'package:coffee_shop_app/data/providers/shop.dart';
import 'package:coffee_shop_app/ui/components/drink_tile.dart';
import 'package:coffee_shop_app/ui/components/my_appbar.dart';
import 'package:coffee_shop_app/ui/components/my_drawer.dart';
import 'package:coffee_shop_app/ui/screens/details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  GridView getShopMenu(List<Drink> fullMenu) {
    return GridView.builder(
        padding:
            const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 30),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 50.0,
          mainAxisSpacing: 20.0,
        ),
        itemCount: fullMenu.length,
        itemBuilder: (BuildContext context, int index) => DrinkTile(
            drink: fullMenu[index],
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(drink: fullMenu[index])));
            }));
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child:  MyAppBar(),
      ),
      drawer: const MyDrawer(),
      body: Column(children: [
        Container(
          width: double.infinity,
          color: customColors?.white,
          padding: const EdgeInsets.only(top: 50, left: 10),
          child: const Text(
            'Drinks',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 20,),
        Expanded(
          child: Container(
            color: customColors?.white,
            child: Consumer<Shop>(
              builder: (context, shop, child) => getShopMenu(shop.menu),
            ),
          ),
        ),
      ]),
    );
  }
}
