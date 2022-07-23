import 'package:flutter/material.dart';
import 'package:flutter_forgetsan/core/constants/colors.dart';
import 'package:flutter_forgetsan/core/methods/const_of_text.dart';
import 'package:flutter_forgetsan/core/methods/shape_of_border.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late final FixedExtentScrollController _fixedExtentScrollController;
  @override
  void initState() {
    _fixedExtentScrollController = FixedExtentScrollController();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _fixedExtentScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: textWidget("History"),
      ),
      body: ListWheelScrollView.useDelegate(
        controller: _fixedExtentScrollController,
        physics: FixedExtentScrollPhysics(),
        itemExtent: 250,
        perspective: 0.010,
        childDelegate: ListWheelChildBuilderDelegate(
            builder: (context, int) {
              return buildCard(int);
            },
            childCount: 10),
      ),
    );
  }
}

Card buildCard(int sayi) {
  return Card(
    shape: shapeforborder(60),
    color: theme1,
    child: Container(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: theme1,
                height: 110,
                width: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    60,
                  ),
                  child: Image.asset(
                    'assets/images/ütü.jpg',
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ],
          ),
          Container(
            height: 30,
            width: 200,
            child: Card(
              color: Colors.black,
              child: Text(
                "Krampon",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: 60,
              width: 300,
              child: Card(
                color: Colors.black,
                child: Text(
                  "Arka koltuklardan en sağdakinin altındaki kutunun içine koydum ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
