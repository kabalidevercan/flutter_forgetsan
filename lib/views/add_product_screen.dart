import 'package:flutter/material.dart';
import 'package:flutter_forgetsan/core/methods/const_of_text.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: textWidget(
          "Add Product",
        ),
      ),
      body: Container(
        child: Center(
          child: Text("ADD PRODUCT"),
        ),
      ),
    );
  }
}
