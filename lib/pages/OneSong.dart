import 'package:flutter/material.dart';
import 'package:tinokutendai_mambo/model/Hymn.dart';

class OneSong extends StatelessWidget {
  
  final Hymn hymn;

  const OneSong(this.hymn);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${hymn.hymnNumber} ${hymn.title}"),
      ),
      body: ListView.builder(
        itemCount: hymn.content.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            title: Text(hymn.content.elementAt(index)),
          );
        },
      ),
    );
  }
}