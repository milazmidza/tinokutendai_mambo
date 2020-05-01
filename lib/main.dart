import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:tinokutendai_mambo/RouteGenerator.dart';
import 'package:tinokutendai_mambo/readFile.dart';
import 'globals.dart';
import 'model/Hymn.dart';
import 'model/Songs.dart';

GlobalVariables _globalVariables = GlobalVariables.getInstance();
int jobDone = 0;
bool navigated = false;
const MaterialColor mainColor = const MaterialColor(
  0xFFFFFFFF,
  const <int, Color>{
    50: const Color(0xFFFFFFFF),
    100: const Color(0xFFFFFFFF),
    200: const Color(0xFFFFFFFF),
    300: const Color(0xFFFFFFFF),
    400: const Color(0xFFFFFFFF),
    500: const Color(0xFFFFFFFF),
    600: const Color(0xFFFFFFFF),
    700: const Color(0xFFFFFFFF),
    800: const Color(0xFFFFFFFF),
    900: const Color(0xFFFFFFFF),
  },
);
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  /*print("Come On Man");
  loadAsset("all_songs").then((onValue){
    print("haaaaa hey");
    print(onValue.split("\n").length);
  });
  print("What again");*/
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //Future<String> wow;
  @override
  Widget build(BuildContext context) {
    
    /*wow = loadAsset("Marongerwo_Edzimbo");
    wow.then((String value){
      print("Musadero guys");
    });*/
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/loading',
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }

  
}

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    loadAsset("title_of_the_book").then((onValue){
      _globalVariables.titleOfTheBook = onValue.replaceAll("�", "");
      checkStatus(context);
    });
    loadAsset("all_songs").then((onValue){
      _globalVariables.allSongs = onValue.replaceAll("�", "");
      checkStatus(context);
    });
    loadAsset("Marongerwo_Edzimbo").then((onValue){
      _globalVariables.marongerwoEdzimbo = onValue.replaceAll("�", "");
      checkStatus(context);
    });
    loadAsset("Marongerwo_Edzimbo_Sande").then((onValue){
      _globalVariables.marongerwoEdzimboSande = onValue.replaceAll("�", "");
      checkStatus(context);
    });
    loadAsset("Dzimbo_Sande").then((onValue){
      _globalVariables.dzimboSande = onValue.replaceAll("�", "");
      checkStatus(context);
    });
    loadAsset("Acknowledgements").then((onValue){
      _globalVariables.acknowledgement = onValue.replaceAll("�", "");
      checkStatus(context);
    });
    loadAsset("Foreword").then((onValue){
      _globalVariables.foreword = onValue.replaceAll("�", "");
      checkStatus(context);
    });
    loadAsset("Dzimbo_Maererano_Nenguva").then((onValue){
      _globalVariables.dzimboMaereranoNenguva = onValue.replaceAll("�", "");
      checkStatus(context);
    });
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 150,
          ),
          child: Column(
            children: <Widget>[
              Text("Looding..."),
              Loading(indicator: BallPulseIndicator(), size: 100.0,color: Colors.blue[400])
            ],
          ),
        ),
      ),
    );
  }
}

void checkStatus(BuildContext context){
  jobDone++;
  if(jobDone>=7 && _globalVariables.allSongs!=null && _globalVariables.marongerwoEdzimbo!=null && !navigated){
    dataReturned();
    navigated = true;
    _globalVariables.allSongs = null;
    _globalVariables.marongerwoEdzimbo = null;
    print("Songs ${_globalVariables.songs.length}");
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed("/");
  }
}

void dataReturned(){
  List<Songs> songTo = List<Songs>();
    List<String> data = _globalVariables.marongerwoEdzimbo.split("\n");
    //getting songs loaded from all_songs.txt file
    Map<int,List<String>> midzaHymns = getAllHyms();

    String letters = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    Songs current;
    for (var item in data) {
      if(letters.contains(item.trim())){
        if(current!=null){
          songTo.add(current);
        }
        current = new Songs();
        current.letter = item.trim();
      }else{
        if(current!=null && item.trim().contains("\t")){
          Hymn wow = new Hymn();
          List<String> eish = item.split("\t");
          wow.title = eish.elementAt(0);
          wow.hymnNumber = int.parse(eish.elementAt(eish.length-1).trim());
          if(midzaHymns.containsKey(wow.hymnNumber)){
            wow.content = midzaHymns.remove(wow.hymnNumber);
          }
          current.hymns.add(wow);
        }
      }
    }
    songTo.add(current);
    _globalVariables.songs = songTo;
    print("songTo.length ${songTo.length}");
    print("_globalVariables.songs.length ${_globalVariables.songs.length}");
  }

Map<int,List<String>> getAllHyms(){
    List<String> allSingleSongsList = _globalVariables.allSongs.split("\n");
    Map<int,List<String>> wowMidza = Map<int,List<String>>();
    Hymn current = new Hymn();
    for (int i = 0; i < allSingleSongsList.length; i++) {
      String item = allSingleSongsList.elementAt(i);
      try {
        if(item.trim().startsWith("1")){
          List<String> wow = item.split(" ");
          try {
            int.parse(wow[1]);
            item = item.trim().replaceAll(" ", "");
          } catch (e) {
          }
        }
        int number = int.parse(item.trim());
        if(number>current.hymnNumber){
          if(current.hymnNumber!=0){
            wowMidza.putIfAbsent(current.hymnNumber, (){return current.content;});
          }
          current = new Hymn();
          current.hymnNumber = number;
        }
        
      } catch (e) {
        if(current.hymnNumber!=null && current.hymnNumber>0){
          current.content.add(item);
        }
      }
    }
    wowMidza.putIfAbsent(current.hymnNumber, (){return current.content;});
    return wowMidza;
  }