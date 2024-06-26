import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/data/providers/theme_provider.dart';
import 'package:coffee_shop_app/ui/components/my_appbar.dart';
import 'package:coffee_shop_app/ui/components/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

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
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(70),
        child:  MyAppBar(),
      ),
      drawer: const MyDrawer(),
      body: Container(
        color: customColors?.background,
        width: MediaQuery.of(context).size.width,
        child:  Column(
          children: [
            const SizedBox(height: 40,),
            // good morning text
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text("Good morning Serano!", style: TextStyle(
                      color: customColors?.textColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),),
                    Text('Yay for coffee!☕️', style: TextStyle(
                      fontSize: 16,
                      color: customColors?.textColor
                    ),)
                  ],),
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
            const SizedBox(height: 30,),

            // bonus rewards
            Container(
              padding: const EdgeInsets.all(20),
              child: Stack(
                children: [
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(8),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(top: 12, bottom: 12, left: 8, right: 8),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: customColors?.green,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)
                            )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                            Text('BONUS REWARDS', style: TextStyle(
                              color: customColors?.textColor,
                              fontSize: 12
                            ),),
                            const SizedBox(height: 5,),
                            Text('Coffee delivered to your house.', style: TextStyle(
                              color: customColors?.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold
                            ),)
                          ],),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Provider.of<ThemeProvider>(context).isDarkMode ? customColors?.black : customColors?.white,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8)
                            )
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 5,),
                              Text('Order 2 bags of coffee and get bonus stars!', style: TextStyle(
                                color: customColors?.textColor,
                                fontWeight: FontWeight.w600,
                                fontSize: 13
                              ),),
                              const SizedBox(height: 10,),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text('Order any of our coffee and get an additional 30 Stars! Now that’s how you get free coffee!', style: TextStyle(
                                  color: customColors?.textColor
                                ),),
                              ),
                              const SizedBox(height: 35,),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                      bottom: 5,
                      right: 5,
                      child: TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 8, bottom: 8, left: 12, right: 12),
                        decoration: BoxDecoration(
                            color: customColors?.brown,
                            borderRadius: BorderRadius.circular(12)),
                        child: Text(
                          'Shop now',
                          style: TextStyle(color: Provider.of<ThemeProvider>(context).isDarkMode ? customColors?.textColor : customColors?.white),
                        ),
                      ))
                  ),
                 Positioned(
                  top: 5,
                  right: 5,
                    child: Image.asset(
                      'lib/assets/bag.png',
                    ),
                  )
                ],
              ),
            ),

            // Favorites section
            // const Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     children: [
            //       HeaderText(text: 'Your favorites'),
            //     ],
            //   ),
            // ),
            const SizedBox(height: 100,)

          ]
        ),
      )
    );
  }
}