import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_forgetsan/core/constants/colors.dart';

import 'package:flutter_forgetsan/views/home_screen.dart';
import 'package:flutter_forgetsan/views/loading_screen.dart';
import 'package:get/get.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: theme1,
        appBarTheme: const AppBarTheme(
          color: Colors.black,
        ),
      ),
      home: Home(),
    );
  }
}
