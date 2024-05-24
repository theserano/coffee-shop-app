import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/ui/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: customColors?.background,
        shadowColor: Colors.black,
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
          SizedBox(width: MediaQuery.of(context).size.width / 3.2,),
          IconButton(
            onPressed: () {},
            iconSize: 35,
            icon: const Icon(Icons.shopping_bag_outlined),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: Container(
        color: customColors?.background,
        width: MediaQuery.of(context).size.width,
        child:  Column(
          children: [
            Divider(color: customColors?.background,),
            Text('home')
          ]
        ),
      )
    );
  }
}