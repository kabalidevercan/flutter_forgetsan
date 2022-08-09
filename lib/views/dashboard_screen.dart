import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_forgetsan/core/constants/colors.dart';
import 'package:flutter_forgetsan/core/methods/const_of_text.dart';
import 'package:flutter_forgetsan/core/methods/shape_of_border.dart';
import 'package:flutter_forgetsan/core/models/things_model.dart';

import '../core/helpers/CRUDhelper.dart';

class DashBoard extends StatefulWidget {
  DashBoard({Key? key}) : super(key: key);

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late final FixedExtentScrollController _fixedExtentScrollController;
  List<Things>? listelerim;

  Future initData() async {
    listelerim = await CrudHelper().getAllThings();
    setState(() {});
  }

  @override
  void initState() {
    _fixedExtentScrollController = FixedExtentScrollController();

    super.initState();
    initData();
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
      body: listelerim != null
          ? ListWheelScrollView.useDelegate(
              controller: _fixedExtentScrollController,
              physics: FixedExtentScrollPhysics(),
              itemExtent: 250,
              perspective: 0.001,
              childDelegate: ListWheelChildBuilderDelegate(
                builder: (context, index) {
                  var liste = listelerim![index];
                  return buildCard(liste);
                },
                childCount: listelerim!.length,
              ),
            )
          : CircularProgressIndicator(),
    );
  }
}

Card buildCard(Things liste) {
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
                    child: liste.imgUrl != null && liste.imgUrl!.length > 2
                        ? Image.file(
                            File(liste.imgUrl!),
                            width: 200.0,
                            height: 200.0,
                            fit: BoxFit.contain,
                          )
                        : Container()),
              ),
            ],
          ),
          Container(
            height: 30,
            width: 200,
            child: Card(
              color: Colors.black,
              child: Text(
                liste.title,
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
                  liste.description ?? "NULL",
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
