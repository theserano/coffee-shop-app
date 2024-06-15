import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/data/models/coffee_order.dart';
import 'package:coffee_shop_app/data/models/drinks.dart';
import 'package:coffee_shop_app/data/providers/coffee_order.dart';
import 'package:coffee_shop_app/data/providers/theme_provider.dart';
import 'package:coffee_shop_app/ui/components/bottom_nav.dart';
import 'package:coffee_shop_app/ui/components/dropdown_button.dart';
import 'package:coffee_shop_app/ui/components/number_value.dart';
import 'package:coffee_shop_app/ui/screens/cart.dart';
import 'package:coffee_shop_app/ui/screens/order.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class Details extends StatefulWidget {
  final Drink drink;
  const Details({super.key, required this.drink});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  final List<String> cupSize = ['Large', 'Normal', 'Small'];
  final List<String> addIns = ['Normal Ice', 'Large Ice', 'Cream'];

  String stateCupSize = '';
  String stateAddIn = '';
  String stateSweetenerAmount = '';
  String stateFlavourAmount = '';

  @override
  void initState() {
    super.initState();
  }

  void _handleCupSizeChange(String newCupSize){
    setState(() {
      stateCupSize = newCupSize;
    });
  }
  void _handleAddIneChange(String newAddIn){
    setState(() {
      stateAddIn = newAddIn;
    });
  }
  void handleSweetenerAmountChange(String newSweetenerAmount){
    setState(() {
      stateSweetenerAmount = newSweetenerAmount;
    });
  }
  void handleFlavourAmountChange(String newFlavourAmount){
    setState(() {
      stateFlavourAmount = newFlavourAmount;
    });
  }

  void getCoffeeOrders() {
    try {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.read<Coffee>().addOrder(CoffeeOrder(
                drink: widget.drink,
                cupSize: stateCupSize,
                addIns: stateAddIn,
                sweetener: stateSweetenerAmount,
                flavour: stateFlavourAmount,
              ));
        });
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OrderPage()));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
  

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      backgroundColor: Provider.of<ThemeProvider>(context, listen: false)
          .isDarkMode ? customColors?.black : customColors?.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          backgroundColor: customColors?.background,
          elevation: 5,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_outlined, color: customColors?.textColor,),
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
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Cart()));
              },
              iconSize: 35,
              icon: Icon(Icons.shopping_bag_outlined, color: customColors?.textColor,),
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
              padding:
                  const EdgeInsets.only(top: 20.0, left: 20.0, bottom: 10.0),
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
            Column(
              children: [
                DropdownOrderMenu(dropDownItems: cupSize, label: 'Cup Size', onItemSelected: _handleCupSizeChange,),
                DropdownOrderMenu(dropDownItems: addIns, label: 'Add Ins', onItemSelected: _handleAddIneChange,),
                NumberValue(label: 'Sweetener', text: 'Splenda packet', onAmountChange: handleSweetenerAmountChange,),
                NumberValue(label: 'Flavour', text: 'Pumpkin spice', onAmountChange: handleFlavourAmountChange,),
              ],
            ),
            const SizedBox(
              height: 50.0,
            ),
            Center(
              child: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      color: customColors?.green,
                      borderRadius: BorderRadius.circular(8)),
                  child: TextButton(
                    onPressed: () {getCoffeeOrders();},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Add to cart', style: TextStyle(fontSize: 21, color: Provider.of<ThemeProvider>(context).isDarkMode ? customColors?.textColor : customColors?.white, fontWeight: FontWeight.w400),),
                      ],
                    ),
                  )),
            ),
            const SizedBox(
              height: 30.0,
            ),
          ],
        ),
      ),
    );
  }
}
