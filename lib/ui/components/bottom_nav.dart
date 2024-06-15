import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/data/providers/theme_provider.dart';
import 'package:coffee_shop_app/ui/screens/account.dart';
import 'package:coffee_shop_app/ui/screens/home_page.dart';
import 'package:coffee_shop_app/ui/screens/order.dart';
import 'package:coffee_shop_app/ui/screens/scan.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BottomNav extends StatefulWidget {
  final int pageIndex;
  const BottomNav({super.key, this.pageIndex = 0});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;

  late List<Widget> pages;
  late Widget currentPage;
  late HomePage homePage;
  late OrderPage orderPage;
  late ScanPage scanPage;
  late AccountPage accountPage;

  @override
  void initState() {
    const homePage = HomePage();
    const orderPage = OrderPage();
    const scanPage = ScanPage();
    const accountPage = AccountPage();

    pages = [homePage, scanPage, orderPage, accountPage];
    currentIndex = widget.pageIndex;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: currentIndex,
          height: 65,
          backgroundColor: Provider.of<ThemeProvider>(context).isDarkMode ? customColors!.background : customColors!.green,
          color: customColors.background,
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
          ]),
      body: pages[currentIndex],
    );
  }
}
