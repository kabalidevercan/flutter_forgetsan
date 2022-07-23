import 'package:flutter/material.dart';
import 'package:flutter_forgetsan/core/constants/colors.dart';
import 'package:flutter_forgetsan/core/methods/const_of_text.dart';
import 'package:flutter_forgetsan/core/methods/shape_of_border.dart';
import 'package:lottie/lottie.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> items = ['English', 'Turkish'];
  String? _selectedItem = 'English';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: textWidget("Settings"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 40,
                  right: 5,
                  left: 5,
                  top: 5,
                ),
                child: Center(
                  child: SizedBox(
                    height: 250,
                    width: 400,
                    child: Card(
                      color: theme1,
                      shape: shapeforborder(30),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                textWidget2("Country"),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 100,
                              width: 300,
                              child: DropdownButtonFormField<String>(
                                focusColor: Colors.black,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.black, width: 2),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(2),
                                      borderSide: BorderSide(
                                        width: 2,
                                        color: Colors.black,
                                      ),
                                    )),
                                value: _selectedItem,
                                onChanged: (item) {
                                  setState(() {
                                    _selectedItem = item;
                                  });
                                },
                                items: items
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(item),
                                        ))
                                    .toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  bottom: 40,
                  right: 5,
                  left: 5,
                ),
                child: Center(
                  child: SizedBox(
                    height: 250,
                    width: 400,
                    child: Card(
                      color: theme1,
                      shape: shapeforborder(30),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Card(
                              color: Colors.black,
                              child: ListTile(
                                leading: Lottie.network(
                                  'https://assets6.lottiefiles.com/packages/lf20_clltdzde.json',
                                  height: 30,
                                ),
                                title: Text(
                                  "Developer İletişim Bilgileri",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              color: Colors.black,
                              child: ListTile(
                                leading: Lottie.network(
                                  'https://assets6.lottiefiles.com/packages/lf20_hjjerpdh.json',
                                  height: 30,
                                ),
                                title: Text(
                                  "Destek Olmak İçin Tıklayın",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Card(
                              color: Colors.black,
                              child: ListTile(
                                leading: Lottie.network(
                                  'https://assets6.lottiefiles.com/packages/lf20_clltdzde.json',
                                  height: 30,
                                ),
                                title: Text(
                                  "Firmamızla İletişim Kurmak için Tıklayın",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
}
