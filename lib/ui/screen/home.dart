import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:veluv/constant/color_pallete.dart';
import 'package:veluv/constant/constant.dart';
import 'package:veluv/ui/componets/custom_paint.dart';
import 'package:veluv/ui/componets/navbar_button.dart';
import 'package:veluv/ui/pages/cart_page.dart';
import 'package:veluv/ui/pages/home_page.dart';
import 'package:veluv/ui/pages/message_page.dart';
import 'package:veluv/ui/pages/profile_page.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TabController _controller;
  int _currentPageIndex = 0;
  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
    _controller.addListener(() {
      setState(() {
        _currentPageIndex = _controller.index;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: ColorPallete.backgroundColor.withAlpha(240),
      extendBody: true,
      body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          controller: _controller,
          children: [HomePage(), MessagePage(), CartPage(), ProfilePage()]),
      floatingActionButton: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              Constants.assetImage('bg-btn-scan.png'),
            ),
          ),
        ),
        padding: EdgeInsets.all(10),
        child: FloatingActionButton(
          elevation: 0,
          backgroundColor: Colors.transparent,
          onPressed: () {},
          child: Center(
            child: SvgPicture.asset(
              Constants.assetIcon('scan.svg'),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Colors.black38, blurRadius: 15)]),
        child: BottomAppBar(
          notchMargin: 15,
          elevation: 20,
          shape: CustomShapeBorder(),
          child: Container(
            decoration: BoxDecoration(),
            padding: EdgeInsets.symmetric(horizontal: 20),
            height: 75,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavBarMenu(
                      isActive: _currentPageIndex == 0,
                      iconSvgFile: 'home.svg',
                      onPressed: () {
                        _controller.animateTo(0);
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    NavBarMenu(
                      isActive: _currentPageIndex == 1,
                      iconSvgFile: 'chat.svg',
                      onPressed: () {
                        _controller.animateTo(1);
                      },
                    ),
                  ],
                ),
                Row(
                  children: [
                   NavBarMenu(
                      isActive: _currentPageIndex == 2,
                      iconSvgFile: 'cart.svg',
                      onPressed: () {
                        _controller.animateTo(2);
                      },
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    NavBarMenu(
                      isActive: _currentPageIndex == 3,
                      iconSvgFile: 'user.svg',
                      onPressed: () {
                        _controller.animateTo(3);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
