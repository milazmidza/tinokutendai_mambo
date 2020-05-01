import 'model/Songs.dart';

class GlobalVariables{
  String titleOfTheBook;
  String allSongs;
  String marongerwoEdzimbo;
  String dzimboSande;
  String marongerwoEdzimboSande;
  String acknowledgement;
  String foreword;
  String dzimboMaereranoNenguva;
  List<Songs> songs = List<Songs>();
  
  
  GlobalVariables._privateConstructor();
  static final GlobalVariables _instance = GlobalVariables._privateConstructor();
  static GlobalVariables getInstance(){ return _instance;}
}