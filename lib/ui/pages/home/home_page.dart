import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopee_clone/cubits/appbar/appbar_cubit.dart';
import 'package:shopee_clone/cubits/cubits.dart';
import 'package:shopee_clone/shared/shared.dart';
import 'package:shopee_clone/ui/widgets/appbar_home.dart';
import 'package:shopee_clone/models/models.dart';
import 'package:shopee_clone/ui/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  ScrollController mainMenuScrollController = ScrollController();

  AnimationController scrollBarAnimationController;

  Animation<Offset> translateBar;
  bool reverse = false;
  int pos = 1;
  List<List<MainMenu>> listOfMainMenu = [];
  Brightness statusBarIconBrightness = Brightness.dark;

  @override
  void initState() {
    scrollController.addListener(() {
      BlocProvider.of<AppbarCubit>(context)
          .scrollOffset(scrollController.offset);
      if (scrollController.offset > 90) {
        if (statusBarIconBrightness != Brightness.light) {
          setState(() {
            statusBarIconBrightness = Brightness.light;
          });
        }
      } else if (scrollController.offset < 80) {
        if (statusBarIconBrightness != Brightness.dark) {
          setState(() {
            statusBarIconBrightness = Brightness.dark;
          });
        }
      }
    });

    sortListMainMenu();

    scrollBarAnimationController =
        AnimationController(duration: Duration(seconds: 0), vsync: this);

    translateBar = Tween(begin: Offset(0, 0), end: Offset(12, 0))
        .animate(scrollBarAnimationController);
    listenScrollBarMainMenu();
    super.initState();
  }

  void listenScrollBarMainMenu() {
    mainMenuScrollController.addListener(() {
      scrollBarAnimationController
          .animateTo(mainMenuScrollController.offset / 100);
    });
  }

  List<List<MainMenu>> sortListMainMenu() {
    for (int i = 0; i < (dummyMainMenu.length / 2); i++) {
      listOfMainMenu.add([
        dummyMainMenu[i * 2],
        dummyMainMenu[i * 2 + 1],
      ]);
      print(dummyMainMenu[i * 2].title +
          "<====>" +
          dummyMainMenu[i * 2 + 1].title);
    }

    return listOfMainMenu;
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: statusBarIconBrightness,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 245,
                      width: screenSize.width,
                      color: MyTheme.whiteColor,
                      clipBehavior: Clip.none,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: 190,
                            width: screenSize.width,
                            child: Image.network(
                              "https://www.rajabeli.com/wp-content/uploads/2020/06/cara-belanja-di-shopee-gratis-ongkir-2.jpg",
                              errorBuilder: (context, object, stakTrace) {
                                return Container(
                                  color: MyTheme.orangeColor,
                                );
                              },
                              fit: BoxFit.cover,
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            left: 20,
                            right: 20,
                            child: Container(
                              height: 55,
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 16),
                              decoration: BoxDecoration(
                                color: MyTheme.whiteColor,
                                borderRadius: BorderRadius.circular(4),
                                boxShadow: [
                                  BoxShadow(
                                    color: MyTheme.greyColor.withOpacity(0.1),
                                    offset: Offset(0, 5),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    height: 24,
                                    width: 24,
                                    color: MyTheme.whiteColor,
                                    child: GestureDetector(
                                      onTap: () {
                                        print(screenSize.width);
                                        print("Tapped");
                                      },
                                      child: SvgPicture.asset(
                                        AssetsPath.icScan,
                                        color: MyTheme.greyColor,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  VerticalDivider(),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 16,
                                                width: 16,
                                                child: SvgPicture.asset(
                                                    AssetsPath.icShopeePay),
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                "Rp1405020",
                                                style: MyTheme.blackText,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "Isi Saldo ShopeePay",
                                          maxLines: 1,
                                          style: MyTheme.greyText.copyWith(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  VerticalDivider(),
                                  const SizedBox(
                                    width: 2,
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Row(
                                            children: [
                                              Container(
                                                height: 16,
                                                width: 16,
                                                child: SvgPicture.asset(
                                                  AssetsPath.icKoin,
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                "0 Koin",
                                                style:
                                                    MyTheme.blackText.copyWith(
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          "Reward Koin Shopee",
                                          maxLines: 1,
                                          style: MyTheme.greyText.copyWith(
                                            fontSize: 10,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 166,
                      width: screenSize.width,
                      child: ListView.builder(
                        controller: mainMenuScrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: listOfMainMenu.length,
                        padding: EdgeInsets.only(left: 15),
                        itemBuilder: (context, index) {
                          return Container(
                            height: double.infinity,
                            width: 80,
                            child: Column(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        margin: EdgeInsets.only(bottom: 10),
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: MyTheme.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: MyTheme.greyColor
                                                .withOpacity(0.3),
                                          ),
                                        ),
                                        child: SvgPicture.asset(
                                            listOfMainMenu[index]
                                                .first
                                                .iconPath),
                                      ),
                                      Text(
                                        listOfMainMenu[index].first.title,
                                        style: MyTheme.blackText.copyWith(
                                          fontSize: 10,
                                        ),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        margin: EdgeInsets.only(bottom: 10),
                                        padding: EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: MyTheme.whiteColor,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            color: MyTheme.greyColor
                                                .withOpacity(0.3),
                                          ),
                                        ),
                                        child: SvgPicture.asset(
                                            listOfMainMenu[index]
                                                .last
                                                .iconPath),
                                      ),
                                      Text(
                                        listOfMainMenu[index].last.title,
                                        style: MyTheme.blackText.copyWith(
                                          fontSize: 10,
                                        ),
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                        height: 4,
                        width: 22,
                        decoration: BoxDecoration(
                          color: MyTheme.greyColor.withOpacity(0.13),
                          borderRadius: BorderRadius.circular(1),
                        ),
                        child: Row(
                          children: [
                            AnimatedBuilder(
                              animation: scrollBarAnimationController,
                              builder: (context, child) => Transform.translate(
                                offset: translateBar.value,
                                child: Container(
                                  height: 4,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    color: MyTheme.orangeColor,
                                    borderRadius: BorderRadius.circular(1),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 90,
                      width: screenSize.width,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Image.asset(imagePath + "banner_1.png"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 2,
                            child: Image.asset(imagePath + "banner_2.png"),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Image.asset(imagePath + "banner_3.png"),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 12,
                      width: screenSize.width,
                      margin: EdgeInsets.only(
                        top: 10,
                      ),
                      color: MyTheme.greyColor.withOpacity(0.1),
                    ),
                    Container(
                      height: 230,
                      width: screenSize.width,
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                              10,
                              0,
                              10,
                              10,
                            ),
                            child: Row(
                              children: [
                                Text("Flash Sale"),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 15,
                                  width: 22,
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    color: MyTheme.blackColor,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "02",
                                      style: MyTheme.whiteText.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 15,
                                  width: 22,
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    color: MyTheme.blackColor,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "02",
                                      style: MyTheme.whiteText.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: 15,
                                  width: 22,
                                  margin: const EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                    color: MyTheme.blackColor,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "02",
                                      style: MyTheme.whiteText.copyWith(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      "Lihat Lainnya\t",
                                      style: MyTheme.greyText.copyWith(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const Icon(
                                      Icons.arrow_forward_ios_rounded,
                                      color: MyTheme.greyColor,
                                      size: 10,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: double.infinity,
                              width: double.infinity,
                              color: MyTheme.greyColor,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                padding: EdgeInsets.only(left: 10),
                                children: [
                                  Container(
                                    height: double.infinity,
                                    margin: EdgeInsets.only(right: 10),
                                    width: 130,
                                    color: MyTheme.whiteColor,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        LinearBar(
                                          quantity: 100,
                                          terjual: 75,
                                          segeraHabis: true,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: double.infinity,
                                    margin: EdgeInsets.only(right: 10),
                                    width: 130,
                                    color: MyTheme.whiteColor,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        LinearBar(
                                          segeraHabis: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: double.infinity,
                                    margin: EdgeInsets.only(right: 10),
                                    width: 130,
                                    color: MyTheme.whiteColor,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        LinearBar(
                                          segeraHabis: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: screenSize.height,
                      width: screenSize.width,
                    ),
                    Container(
                      height: screenSize.height,
                      width: screenSize.width,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: BlocBuilder<AppbarCubit, double>(
                builder: (_, scrollOffset) => AppbarHome(
                  scrollOffset: scrollOffset,
                  iconColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
