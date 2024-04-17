import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:coffeeshopapp/screens/cartscreen.dart';
import 'package:coffeeshopapp/screens/settingsscreen.dart';
import 'package:coffeeshopapp/screens/shopscreen.dart';
import 'package:coffeeshopapp/screens/tokenscreen.dart';
import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter_icons_null_safety/flutter_icons_null_safety.dart';

class NavigationScreen extends StatefulWidget {
  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final pagecontroller = PageController();
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 237, 201, 154),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Color.fromARGB(0, 249, 153, 57),
          elevation: 0,
          centerTitle: true,
          title: ShaderMask(
            shaderCallback: (bounds) {
              return LinearGradient(colors: [
                Color.fromARGB(255, 123, 55, 30),
                Color.fromARGB(255, 182, 118, 54),
                Color.fromARGB(255, 155, 77, 0)
              ]).createShader(bounds);
            },
            child: Text(
              "Mocha Moments",
              style: TextStyle(
                  fontFamily: "Food Zone",
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
          ),
        ),
      ),
      body: PageView(
        onPageChanged: (value) {
          setState(() {
            _index = value;
          });
        },
        controller: pagecontroller,
        physics: NeverScrollableScrollPhysics(),
        children: [
          ShopScreen(),
          TokenScreen(),
          CartScreen(),
          SettingScreen(),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: Colors.white,
          strokeColor: Colors.white,
          unSelectedColor: Colors.grey[600],
          backgroundColor: Colors.black,
          borderRadius: Radius.circular(20.0),
          blurEffect: true,
          opacity: 0.8,
          currentIndex: _index,
          onTap: (index) {
            setState(() {
              _index = index;
              pagecontroller.jumpToPage(index);
            });
          },
          isFloating: true,
          items: [
            CustomNavigationBarItem(icon: Icon(Entypo.shop)),
            CustomNavigationBarItem(icon: Icon(FontAwesome.coffee)),
            CustomNavigationBarItem(icon: Icon(FontAwesome.shopping_cart)),
            CustomNavigationBarItem(icon: Icon(Ionicons.md_settings)),
          ],
        ),
      ),
    );
  }
}
