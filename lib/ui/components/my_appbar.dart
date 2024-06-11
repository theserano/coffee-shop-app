import 'package:coffee_shop_app/ui/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart()));
          },
          iconSize: 35,
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
      ],
    );
  }
}
