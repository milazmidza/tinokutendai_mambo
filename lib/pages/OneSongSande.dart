import 'package:flutter/material.dart';
import 'package:tinokutendai_mambo/CustomDrawer.dart';
import 'package:tinokutendai_mambo/model/Hymn.dart';

class OneSongSande extends StatelessWidget {
  
  final Hymn hymn;

  OneSongSande(this.hymn);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("One Song Sande"),
      ),
      drawer: CustomDrawer(),
      body: Center(
        child: Text("About the Book"),
      ),
    );
  }
}