import 'package:flutter/material.dart';
import 'package:tinokutendai_mambo/CustomDrawer.dart';

class DzimboSande extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dzimbo Sande"),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text("Dzimbo Sande coming soon.."),
      ),
    );
  }
}