import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_forgetsan/core/constants/colors.dart';
import 'package:flutter_forgetsan/views/add_product_screen.dart';
import 'package:flutter_forgetsan/views/dashboard_screen.dart';
import 'package:flutter_forgetsan/views/settings_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _activeindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          Get.to(
            () => AddProduct(),
          );
        },
        child: Icon(
          Icons.add,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: _activeindex == 0 ? DashBoard() : Settings(),
      bottomNavigationBar: AnimatedBottomNavigationBar(
        backgroundColor: Colors.black,
        gapLocation: GapLocation.center,
        activeColor: Colors.white,
        inactiveColor: Colors.grey,
        notchSmoothness: NotchSmoothness.verySmoothEdge,
        icons: [
          Icons.history_sharp,
          Icons.settings,
        ],
        activeIndex: _activeindex,
        onTap: (int) {
          _activeindex = int;
          setState(() {});
        },
      ),
    );
  }
}
