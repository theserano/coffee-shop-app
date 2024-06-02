import 'package:coffee_shop_app/data/models/drinks.dart';
import 'package:coffee_shop_app/ui/components/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Details extends StatefulWidget {
  final Drink drink;
  const Details({super.key, required this.drink});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          elevation: 5,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
            iconSize: 23,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const BottomNav(pageIndex: 2,)));
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
      body: SingleChildScrollView(
        child: Column(children: [
          Image.asset(widget.drink.imagePath)
        ],),
      ),
    );
  }
}