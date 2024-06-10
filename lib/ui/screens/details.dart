import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/data/models/drinks.dart';
import 'package:coffee_shop_app/ui/components/bottom_nav.dart';
import 'package:coffee_shop_app/ui/components/dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Details extends StatefulWidget {
  final Drink drink;
  const Details({super.key, required this.drink});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {

  final List<String> cupSize = ['Large', 'Normal', 'Small'];
  final List<String> addIns = ['Normal Ice', 'Large Ice', 'Cream'];


  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40.0),
              decoration: BoxDecoration(
                color: customColors?.green,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Image.asset(widget.drink.imagePath),
                  const SizedBox(
                    width: 50.0,
                  ),
                  Text(
                    widget.drink.name,
                    style: TextStyle(
                        color: customColors?.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20.0, bottom: 10.0),
              child: Text(
                "What's included",
                style: TextStyle(
                    color: customColors?.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Column(children: [
              DropdownOrderMenu(dropDownItems: cupSize, label: 'Cup Size'),
              DropdownOrderMenu(dropDownItems: addIns, label: 'Add Ins'),
            ],)
          ],
        ),
      ),
    );
  }
}
