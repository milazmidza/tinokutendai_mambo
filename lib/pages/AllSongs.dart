import 'package:flutter/material.dart';
import 'package:tinokutendai_mambo/CustomDrawer.dart';
import 'package:tinokutendai_mambo/model/Songs.dart';
import '../globals.dart';

class AllSongs extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hymn"),
      ),
      body: Container(
        child: SongsListBuilder(),
      ),
      drawer: CustomDrawer(),
    );
  }
}

class SongsListBuilder extends StatefulWidget {
  
  
  SongsListBuilder({Key key}) : super(key: key);
  final GlobalVariables _globalVariables = GlobalVariables.getInstance();
  @override
  _SongsListBuilderState createState() => _SongsListBuilderState();

  

  

}

class _SongsListBuilderState extends State<SongsListBuilder> {

  Songs currentSong;

_SongsListBuilderState();

  @override
  Widget build(BuildContext context) {
    return buildListView();
    
    
  }

  Widget buildListView(){
    if(currentSong == null){
      try {
        currentSong = widget._globalVariables.songs.elementAt(0);
      } catch (e) {
        currentSong = Songs();
      }
      //
    }
    return Padding(
      padding: const EdgeInsets.only(
        left: 10.0,
        right: 10.0,
        top: 6.0
      ),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: 6.0
            ),
            child: Container(
              height: 40,
              color: Colors.white,
              child: ListView.builder(
                itemCount: widget._globalVariables.songs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          currentSong = widget._globalVariables.songs.elementAt(index);
                        });
                      },
                      child: Container(
                        height: 25,
                        width: 40,
                        color: Colors.blue[400],
                        child: Center(
                          child: Text(widget._globalVariables.songs.elementAt(index).letter,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          )
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height - 150 > 0 ? MediaQuery.of(context).size.height - 150:150,
              child: ListView.builder(
                itemCount: currentSong.hymns.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index){
                  return ListTile(
                    title: Text(currentSong.hymns.elementAt(index).title),
                    trailing: Icon(Icons.audiotrack),
                    leading: CircleAvatar(
                      backgroundColor:  Colors.blue[400],
                      child: Text(currentSong.hymns.elementAt(index).hymnNumber.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: currentSong.hymns.elementAt(index).hymnNumber>999?16:20,
                        ),
                      ),
                    ),
                    onTap: (){
                      Navigator.of(context).pushNamed("/oneSong",arguments: currentSong.hymns.elementAt(index));
                    },
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }


}