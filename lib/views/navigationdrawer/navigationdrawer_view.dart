import 'package:flutter/material.dart';
import 'package:ui_project/views/navigationdrawer/components/about.dart';

class NavigationdrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Navigationdrawer(),
    );
  }
}

class Navigationdrawer extends StatefulWidget {
  @override
  _NavigationdrawerState createState() => _NavigationdrawerState();
}

class _NavigationdrawerState extends State<Navigationdrawer> {
  List users;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text("Home")),
      body: Text('body'),
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            new UserAccountsDrawerHeader(
              currentAccountPicture: new CircleAvatar(
                backgroundImage: NetworkImage(
                    'http://192.168.8.100/mucassa/images/laravel-logo.png.jpg'),
              ),
              accountName: Text('Samuel Bie'),
              accountEmail: Text('samuel@mail.com'),
            ),
            ListTile(
              onTap: () {
                Navigator.pop(context); 
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new AboutPage(),
                  ),
                );
              },
              title: Text('About page'),
            )
          ],
        ),
      ),
    );
  }
}
