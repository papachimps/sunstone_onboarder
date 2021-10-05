import 'package:flutter/material.dart';
import 'package:concentric_transition/concentric_transition.dart';

import 'constants.dart';
import 'page_card.dart';




class Onboarder extends StatelessWidget {
  final List<PageData> pages = [
    PageData(
      assetPath: assetPath('news'),
      title: "Local news\nstories",
      textColor: Colors.white,
      bgColor: pageColor1,
    ),
    PageData(
      assetPath: assetPath('compare'),
      title: "Choose your\ninterests",
      bgColor: pageColor2,
      textColor: Colors.white,
    ),
    PageData(
      assetPath: assetPath('drag'),
      title: "Drag and\ndrop to move",
      bgColor: Colors.white,
      // textColor: Colors.white,
    ),
  ];

  Onboarder({Key? key}) : super(key: key);

  List<Color> get colors => pages.map((p) => p.bgColor).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ConcentricPageView(
        // scaleFactor: 1.2,
        colors: colors,
        radius: 45,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 1000),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (index, value) {
          PageData page = pages[index % pages.length];
          return Stack(
            alignment: Alignment.center,
            children: [
              PageCard(page: page),
              Positioned(
                bottom: 100 + 45,
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: page.bgColor,
                ),
              ),
              Positioned(
                top: 70,
                left: 30,
                right: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Storief',
                      style: appBarTextStyle.copyWith(
                        color: page.textColor,
                      ),
                    ),
                    Text(
                      'Skip',
                      style: appBarTextStyle.copyWith(
                        color: page.textColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
