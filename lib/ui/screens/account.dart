import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/data/providers/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  bool stateOne = false;
  bool stateTwo = false;
  bool stateThree = false;
  bool stateFour = false;

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('settings'),
        backgroundColor: customColors?.background,
      ),
      backgroundColor: customColors?.background,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: TextStyle(
                        color: customColors?.textColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                      ),
                    ),
                    const Text(
                      'Welcome serano!',
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: customColors?.textColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: SvgPicture.asset(
                    'lib/assets/avatar.svg',
                    semanticsLabel: 'avatar',
                    width: 40,
                    // ignore: deprecated_member_use
                    color: customColors?.background,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 25, top: 10),
            child: Row(
              children: [
                const Text(
                  'Dark Mode'),
                const Spacer(),
                CupertinoSwitch(
                  value: Provider.of<ThemeProvider>(context, listen: false)
                      .isDarkMode,
                  onChanged: (value) {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .toggleTheme();
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 25, top: 10),
            child: Row(
              children: [
                const Text(
                  '2- factor authentication'),
                const Spacer(),
                CupertinoSwitch(
                  value: stateTwo,
                  onChanged: (value) {
                    setState(() {
                      stateTwo = !stateTwo;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 25, top: 10),
            child: Row(
              children: [
                const Text(
                  'FACE ID'),
                const Spacer(),
                CupertinoSwitch(
                  value: stateThree,
                  onChanged: (value) {
                    setState(() {
                      stateThree = !stateThree;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 15, right: 25, top: 10),
            child: Row(
              children: [
                const Text(
                  'Password Lock'),
                const Spacer(),
                CupertinoSwitch(
                  value: stateFour,
                  onChanged: (value) {
                    setState(() {
                      stateFour = !stateFour;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}