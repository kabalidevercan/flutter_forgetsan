import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_forgetsan/core/constants/colors.dart';
import 'package:flutter_forgetsan/core/methods/const_of_text.dart';
import 'package:flutter_forgetsan/core/models/things_model.dart';
import 'package:flutter_forgetsan/core/services/ercan.dart';

import 'package:get/get_connect/http/src/utils/utils.dart';

class AddProduct extends StatefulWidget {
  AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  late final TextEditingController _nameTextEditingController;
  late final TextEditingController _descriptionTextEditingController;
  String date = DateTime.now().toString();

  @override
  void initState() {
    _nameTextEditingController = TextEditingController();
    _descriptionTextEditingController = TextEditingController();

    super.initState();
  }

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
        color: theme1,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 200,
                      width: 200,
                      child: Card(
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextField(
                        controller: _nameTextEditingController,
                        decoration: InputDecoration(
                          hintText: 'Enter the name of your thing',
                          labelText: 'Name',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: theme1,
                              width: 2,
                            ),
                          ),
                          border: OutlineInputBorder(),
                          suffixIcon: _nameTextEditingController.text.isEmpty
                              ? SizedBox(
                                  width: 0,
                                )
                              : IconButton(
                                  onPressed: () =>
                                      _nameTextEditingController.clear(),
                                  icon: Icon(
                                    Icons.close,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: TextField(
                        controller: _descriptionTextEditingController,
                        decoration: InputDecoration(
                          labelText: 'Description',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                          border: OutlineInputBorder(),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: theme1,
                              width: 2,
                            ),
                          ),
                          suffixIcon: _descriptionTextEditingController
                                  .text.isEmpty
                              ? Container(
                                  width: 0,
                                )
                              : IconButton(
                                  onPressed: () =>
                                      _descriptionTextEditingController.clear(),
                                  icon: Icon(
                                    Icons.close,
                                  ),
                                ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: theme1,
                        ),
                        onPressed: () async {
                          await DatePicker.showDateTimePicker(context,
                              theme: DatePickerTheme(
                                backgroundColor: Colors.white,
                                doneStyle: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold,
                                ),
                                cancelStyle: TextStyle(
                                  color: theme1,
                                  fontWeight: FontWeight.bold,
                                ),
                                itemStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              showTitleActions: true,
                              minTime:
                                  DateTime(DateTime.now().year, 1, 5, 20, 50),
                              maxTime:
                                  DateTime(DateTime.now().year, 12, 7, 05, 09),
                              onChanged: (dates) {}, onConfirm: (dates) {
                            setState(() {
                              date = dates.toString();
                            });
                          }, locale: LocaleType.tr);
                        },
                        child: Text(
                          'Select Time',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 10,
                    ),
                    IconButton(
                      iconSize: 60,
                      color: Colors.pink,
                      onPressed: () {
                        Ercan().liste.add(Things(
                              title: _nameTextEditingController.value.text,
                              description:
                                  _descriptionTextEditingController.value.text,
                              imgUrl:
                                  'http://www.bilgiuzmani.com/resim/yuklenen/459733-sevimli-kopekler-2.jpg',
                              dateTime: DateTime.parse(
                                date,
                              ),
                            ));
                      },
                      icon: Icon(
                        Icons.done,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
