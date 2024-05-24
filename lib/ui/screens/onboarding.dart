import 'package:coffee_shop_app/core/themes/custom_colors.dart';
import 'package:coffee_shop_app/data/models/onbard.dart';
import 'package:coffee_shop_app/ui/components/bottom_nav.dart';
import 'package:coffee_shop_app/ui/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final customColors = Theme.of(context).extension<CustomColors>();
    return Scaffold(
      backgroundColor: customColors?.cream,
      body: Padding(
        padding: const EdgeInsets.only(bottom: 50.0, left: 10.0, right: 20.0),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: const Text("Skip"))
              ],
            ),
            // Main image part
            Expanded(
                child: PageView.builder(
                    itemCount: contents.length,
                    controller: _controller,
                    onPageChanged: (int index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    itemBuilder: (_, i) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 8,
                            ),
                            Image.asset(
                              contents[i].image,
                              width: MediaQuery.of(context).size.width / 1.5,
                            ),
                            const SizedBox(
                              height: 70,
                            ),
                            Text(
                              contents[i].title,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold, color: customColors?.white),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(contents[i].description, style: TextStyle(color: customColors?.white),)
                          ],
                        ),
                      );
                    })),

            // below part
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    children: List.generate(
                        contents.length, (index) => buildDot(index, context))),
                GestureDetector(
                  onTap: () {
                    if (currentIndex == contents.length - 1) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BottomNav()));
                    }
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.fastOutSlowIn);
                  },
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 40, right: 40, top: 10, bottom: 10),
                    decoration: BoxDecoration(
                        color: customColors?.brown,
                        borderRadius: BorderRadius.circular(8)),
                    child: Text(
                      'Next',
                      style: TextStyle(
                          color: customColors?.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      child: currentIndex == index
          ? SvgPicture.asset(
              'lib/assets/brown_nut.svg',
              semanticsLabel: 'nut',
            )
          : SvgPicture.asset(
              'lib/assets/white_nut.svg',
              semanticsLabel: 'nut',
            ),
    );
  }
}
