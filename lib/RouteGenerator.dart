import 'package:flutter/material.dart';
import 'package:tinokutendai_mambo/model/Hymn.dart';
import 'package:tinokutendai_mambo/pages/AboutTheBook.dart';
import 'package:tinokutendai_mambo/pages/Acknowledgements.dart';
import 'package:tinokutendai_mambo/pages/DzimboMaereranoNenguva.dart';
import 'package:tinokutendai_mambo/pages/DzimboSande.dart';
import 'package:tinokutendai_mambo/pages/Foreword.dart';
import 'package:tinokutendai_mambo/pages/AllSongs.dart';
import 'package:tinokutendai_mambo/pages/OneSong.dart';
import 'package:tinokutendai_mambo/pages/OneSongSande.dart';
import 'package:tinokutendai_mambo/main.dart';

class RouteGenerator{
  static Route<dynamic> generateRoute(RouteSettings settings){
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => AllSongs());
        break;
      
      case '/dzimboSande':
        return MaterialPageRoute(builder: (_) => DzimboSande());
        break;

      case '/acknowledgement':
        return MaterialPageRoute(builder: (_) => Acknowledgements());
        break;

      case '/dzimboMaereranoNemguva':
        return MaterialPageRoute(builder: (_) => DzimboMaereranoNenguva());
        break;

      case '/foreword':
        return MaterialPageRoute(builder: (_) => Foreword());
        break;

      case '/aboutTheBook':
        return MaterialPageRoute(builder: (_) => AboutTheBook());
        break;

      case '/oneSong':
        if(args is Hymn){
          return MaterialPageRoute(builder: (_) => OneSong(args));
        }
        return MaterialPageRoute(builder: (_) => ErrorPage());
        break;

      case '/oneSongSande':
        if(args is Hymn){
          return MaterialPageRoute(builder: (_) => OneSongSande(args));
        }
        return MaterialPageRoute(builder: (_) => ErrorPage());
        break;

      case '/loading':
        return MaterialPageRoute(builder: (_) => LoadingPage());
        break;
      default:
        return MaterialPageRoute(builder: (_) => ErrorPage());
        break;
    }
  }
}

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ERROR"),
      ),
      body: Center(
        child: Text("Something Went wron"),
      ),
    );
  }
}

