import 'package:flutter/material.dart';
import 'package:flutter_forgetsan/core/constants/colors.dart';
import 'package:flutter_forgetsan/core/methods/shape_of_border.dart';
import 'package:flutter_forgetsan/core/models/things_model.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  final String? payload;

  const Loading({Key? key, required this.payload}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: theme1,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(payload ?? ''),
              Center(
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
            ],
          ),
        ),
      ),
    );
  }
}
