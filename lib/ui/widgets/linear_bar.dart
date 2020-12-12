import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shopee_clone/shared/shared.dart';

class LinearBar extends StatelessWidget {
  final int quantity;
  final int terjual;
  final bool segeraHabis;
  final double width;
  final double height;

  const LinearBar({
    Key key,
    this.quantity = 10,
    this.terjual = 5,
    this.segeraHabis = false,
    this.width = 110,
    this.height = 13,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double percent = (terjual / quantity);
    return Container(
      height: height,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        alignment: Alignment.bottomCenter,
        clipBehavior: Clip.none,
        children: [
          LinearPercentIndicator(
            width: width,
            lineHeight: height,
            percent: percent,
            backgroundColor: MyTheme.greyColor.withOpacity(0.2),
            linearGradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: const [
                MyTheme.orangeColor,
                Colors.orange,
              ],
            ),
          ),
          Positioned(
            left: 10,
            bottom: 8,
            child: Icon(
              Icons.fire_extinguisher_rounded,
              color: MyTheme.orangeColor,
            ),
          ),
        ],
      ),
    );
  }
}
