import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/ui/screens/account.dart';
import 'package:coffee_shop_app/ui/screens/home_page.dart';
import 'package:coffee_shop_app/ui/screens/order.dart';
import 'package:coffee_shop_app/ui/screens/rewards.dart';
import 'package:coffee_shop_app/ui/screens/scan.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late HomePage homePage;
  late RewardsPage rewardsPage;
  late OrderPage orderPage;
  late ScanPage scanPage;
  late AccountPage accountPage;

  @override
  void initState() {
    const homePage = HomePage();
    const rewardsPage = RewardsPage();
    const orderPage = OrderPage();
    const scanPage = ScanPage();
    const accountPage = AccountPage();

    pages = [homePage, scanPage, orderPage, accountPage, rewardsPage];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
          height: 65,
          backgroundColor: customColors!.green,
          color: Colors.white,
          animationDuration: const Duration(milliseconds: 200),
          animationCurve: Curves.bounceInOut,
          onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          items: [
            Icon(
              Icons.home_outlined,
              color: customColors.green,
            ),
            Icon(
              Icons.qr_code_2_outlined,
              color: customColors.green,
            ),
            Icon(Icons.shopping_bag_outlined, color: customColors.green),
            Icon(Icons.person_2_outlined, color: customColors.green),
            Icon(Icons.star_border_outlined, color: customColors.green)
          ]),
      body: pages[currentIndex],
    );
  }
}
