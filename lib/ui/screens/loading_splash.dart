import 'dart:async';

import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/ui/screens/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoadingSplashPage extends StatefulWidget {
  const LoadingSplashPage({super.key});

  @override
  State<LoadingSplashPage> createState() => _LoadingSplashPageState();
}

class _LoadingSplashPageState extends State<LoadingSplashPage> {
  int currentIndex = 0;
  List nuts = [];

  @override
  void initState() {
    super.initState();

    Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (currentIndex < 10) {
        setState(() {
          currentIndex++;
          nuts.add(currentIndex);
        });
      } else {
        timer.cancel();
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Onboarding()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      backgroundColor: customColors?.cream,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'lib/assets/container.svg',
              semanticsLabel: 'coffee',
              width: MediaQuery.of(context).size.width / 2,
            ),
            const SizedBox(
              height: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:
                List.generate(nuts.length, (index) => buildNuts(index, context))
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNuts(int index, BuildContext context){
    return Transform(
      alignment: Alignment.center,
      transform: currentIndex.isEven ? Matrix4.rotationZ(-0.5) : Matrix4.rotationZ(0),
      child: SvgPicture.asset(
        'lib/assets/brown_nut.svg',
        semanticsLabel: 'nut',
      ),
    );
  }
}
