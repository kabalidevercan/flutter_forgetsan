import 'package:flutter/material.dart';
import 'package:flutter_forgetsan/core/constants/colors.dart';
import 'package:flutter_forgetsan/core/methods/shape_of_border.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: theme1,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: SizedBox(
              height: 600,
              width: 450,
              child: Card(
                shape: shapeforborder(30),
                child: Lottie.network(
                  'https://assets9.lottiefiles.com/packages/lf20_beqkhm5y.json',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
