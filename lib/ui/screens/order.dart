import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/data/models/drinks.dart';
import 'package:coffee_shop_app/data/models/shop.dart';
import 'package:coffee_shop_app/ui/components/dinrk_tile.dart';
import 'package:coffee_shop_app/ui/components/my_drawer.dart';
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
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
        ),
        itemBuilder: (BuildContext context, int index) =>
            DrinkTile(drink: fullMenu, onTap: () {}));
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          elevation: 5,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.menu),
                iconSize: 35,
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          actions: [
            SvgPicture.asset(
              'lib/assets/container.svg',
              semanticsLabel: 'coffee cup',
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 3.2,
            ),
            IconButton(
              onPressed: () {},
              iconSize: 35,
              icon: const Icon(Icons.shopping_bag_outlined),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
      body: Container(
        color: customColors?.background,
        child: Consumer<Shop>(
          builder: (context, shop, child) => getShopMenu(shop.menu),
        ),
      ),
    );
  }
}
