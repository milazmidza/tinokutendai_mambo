import 'package:flutter/material.dart';
import 'package:tinokutendai_mambo/CustomDrawer.dart';

class DzimboMaereranoNenguva extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dzimbo Maererano Nenguva"),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text("Dzimbo Maererano Nenguva coming soon.."),
      ),
    );
  }
}