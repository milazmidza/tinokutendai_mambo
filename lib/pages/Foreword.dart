import 'package:flutter/material.dart';
import 'package:tinokutendai_mambo/CustomDrawer.dart';

import '../globals.dart';

class Foreword extends StatelessWidget {
  final GlobalVariables _globalVariables = GlobalVariables.getInstance();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Foreword"),
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
              _globalVariables.foreword,
              style: TextStyle(
                letterSpacing: 3,
                wordSpacing: 4,
              ),
            ),
          ],
        ),
      )
    );
  }
}