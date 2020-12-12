import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopee_clone/shared/assets_path.dart';
import 'package:shopee_clone/ui/pages/home/home_page.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomNavigationIndex = 0;
  PageController pageController = PageController();

  @override
  void initState() {
    pageController = PageController(
      initialPage: bottomNavigationIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: NeverScrollableScrollPhysics(),
        children: [
          HomePage(),
          Center(
            child: Text("Feed"),
          ),
          Center(
            child: Text("Shopee Live"),
          ),
          Center(
            child: Text("Notifikasi"),
          ),
          Center(
            child: Text("Saya"),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: bottomNavigationIndex,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            pageController.jumpToPage(index);
            bottomNavigationIndex = index;
          });
        },
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: [
          BottomNavigationBarItem(
            label: "Beranda",
            icon: Container(
              height: 24,
              width: 24,
              margin: EdgeInsets.only(
                bottom: 5,
              ),
              child: SvgPicture.asset(
                bottomNavigationIndex == 0
                    ? AssetsPath.icHomeSelected
                    : AssetsPath.icHome,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Feed",
            icon: Container(
              height: 24,
              width: 24,
              margin: EdgeInsets.only(
                bottom: 5,
              ),
              child: SvgPicture.asset(
                bottomNavigationIndex == 1
                    ? AssetsPath.icFeedSelected
                    : AssetsPath.icFeed,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Shopee Live",
            icon: Container(
              height: 24,
              width: 24,
              margin: EdgeInsets.only(
                bottom: 5,
              ),
              child: SvgPicture.asset(
                bottomNavigationIndex == 2
                    ? AssetsPath.icLiveSelected
                    : AssetsPath.icLive,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Notifikasi",
            icon: Container(
              height: 24,
              width: 24,
              margin: EdgeInsets.only(
                bottom: 5,
              ),
              child: SvgPicture.asset(
                bottomNavigationIndex == 3
                    ? AssetsPath.icNotifSelected
                    : AssetsPath.icNotif,
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: "Saya",
            icon: Container(
              height: 24,
              width: 24,
              margin: EdgeInsets.only(
                bottom: 5,
              ),
              child: SvgPicture.asset(
                bottomNavigationIndex == 4
                    ? AssetsPath.icSayaSelected
                    : AssetsPath.icSaya,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
