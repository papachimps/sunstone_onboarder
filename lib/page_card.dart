import 'package:flutter/material.dart';

import 'constants.dart';

class PageCard extends StatelessWidget {
  final PageData page;

  const PageCard({
    Key? key,
    required this.page,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 30.0,
      ),
      child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _buildPicture(context),
          const SizedBox(height: 30),
          _buildText(context, textColor: page.textColor),
        ],
      ),
    );
  }

  Widget _buildText(BuildContext context, {Color textColor = Colors.white}) {
    return Text(
      page.title!,
      style: defaultTextStyle.copyWith(
        fontSize: 40,
        color: textColor,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildPicture(
    BuildContext context, {
    double size = 190,
    double assetSize = 150,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: ShapeDecoration(
        shape: const ContinuousRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(60.0)),
        ),
        color: page.bgColor
            .withBlue(page.bgColor.blue - 80)
            .withGreen(page.bgColor.green + 40)
            .withRed(page.bgColor.red - 120)
            .withAlpha(50),
      ),
      margin: const EdgeInsets.only(
        top: 140,
      ),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: Image.asset(
              page.assetPath ?? 'assets/sun.gif',
              height: assetSize,
              width: assetSize,
            ),
          ),
        ],
      ),
    );
  }
}

class PageData {
  final String? title;
  final String? assetPath;
  final Color bgColor;
  final Color textColor;

  PageData({
    this.title,
    this.assetPath,
    this.bgColor = Colors.white,
    this.textColor = Colors.black,
  });
}
