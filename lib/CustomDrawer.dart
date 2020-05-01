import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/logo.jpg"),
                fit: BoxFit.fill
              ),
            ),
            accountName: Text("TINOKUTENDAI MAMBO"),
            accountEmail: Text("DZIMBO DZEKIRIKE KATORIKE"),
          ),
          CustomListTile("Dzimbo", Icons.arrow_right, "/",),
          CustomListTile("Dzimbo Sande", Icons.arrow_right, "/dzimboSande",),
          CustomListTile("Dzimbo Maererano Nenguva", Icons.arrow_right, "/dzimboMaereranoNemguva",),
          CustomListTile("About the book", Icons.arrow_right, "/aboutTheBook",),
          CustomListTile("Acknowledgements", Icons.arrow_right, "/acknowledgement",),
          CustomListTile("Foreword", Icons.arrow_right, "/foreword",),
          //CustomListTile("Help", Icons.arrow_right, "/help",),
        ],
      ),
    );
  }
}

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String routName;

  const CustomListTile(this.title, this.icon, this.routName);
  
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Icon(icon),
      onTap: (){
        Navigator.of(context).pop();
        Navigator.of(context).pushNamed(routName);
      },
    );
  }
}