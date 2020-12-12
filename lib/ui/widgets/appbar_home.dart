import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopee_clone/shared/shared.dart';

class AppbarHome extends StatelessWidget {
  final double scrollOffset;
  final Color iconColor;

  const AppbarHome(
      {Key key, this.scrollOffset = 0.0, this.iconColor = MyTheme.blackColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        image: DecorationImage(
          image: AssetImage(
            AssetsPath.imgBgAppbar,
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black
                .withOpacity((scrollOffset / 100).clamp(0, 1).toDouble()),
            BlendMode.dstATop,
          ),
        ),
      ),
      child: Container(
        height: 40,
        width: double.infinity,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: MyTheme.whiteColor,
                    borderRadius: BorderRadius.circular(2),
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(AssetsPath.icSearch),
                      ),
                      MyTheme.spacerW10,
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Diskon Akhir Tahun",
                            hintStyle: MyTheme.orangeText,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      MyTheme.spacerW10,
                      Container(
                        height: 20,
                        width: 20,
                        child: SvgPicture.asset(AssetsPath.icCamera),
                      ),
                    ],
                  ),
                ),
              ),
              MyTheme.spacerW16,
              Container(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  AssetsPath.icCheckout,
                  color: MyTheme.whiteColor,
                ),
              ),
              MyTheme.spacerW16,
              Container(
                height: 24,
                width: 24,
                child: SvgPicture.asset(
                  AssetsPath.icChat,
                  color: MyTheme.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
