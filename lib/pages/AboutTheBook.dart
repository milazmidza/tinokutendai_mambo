import 'package:flutter/material.dart';
import 'package:tinokutendai_mambo/CustomDrawer.dart';

import '../globals.dart';

class AboutTheBook extends StatelessWidget {
  final GlobalVariables _globalVariables = GlobalVariables.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("About the book"),
      ),
      drawer: CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 15,
          right: 15,
        ),
        child: ListView(
          children: <Widget>[
            Text(
              _globalVariables.titleOfTheBook,
              style: TextStyle(
                letterSpacing: 3,
                wordSpacing: 4,
                fontWeight: FontWeight.bold,
                fontSize: 18
              ),
            ),
          ],
        ),
      )
    );
  }
}