import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as Json;

class HttpHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new HttpRequest(),
    );
  }
}

class HttpRequest extends StatefulWidget {
  @override
  _HttpRequestState createState() => _HttpRequestState();
}

class _HttpRequestState extends State<HttpRequest> {
  List users;

  Future<String> makeRequest() async {
    var url = "http://192.168.8.101/api/user";
    var response = await http
        .get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    var data = jsonDecode(response.body);
    setState(() {
      users = data;
    });
  }

  @override
  void initState() {
    super.initState();
    makeRequest();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: Text("Home")),
      body: ListView.builder(
        itemBuilder: (BuildContext context, i) {
          return new ListTile(
            onTap: () {
              Navigator.push(
                context,
                new MaterialPageRoute(
                    builder: (BuildContext context) =>
                        new SecondPage(this.users[i])),
              );
            },
            title: Text(this.users[i]['name']),
            subtitle: Text(this.users[i]['phone']),
            leading: new CircleAvatar(
                backgroundImage: NetworkImage('http://192.168.8.101/mucassa/images/laravel-logo.png.jpg'),
                ),
          );
        },
        itemCount: this.users != null ? this.users.length : 0,
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  final data;
  SecondPage(this.data);
  @override
  Widget build(BuildContext context) => new Scaffold(
        appBar: new AppBar(
          title: Text('Details Page'),
        ),
        body: new Center(
          child: new Container(
            width: 150,
            height: 150,
            decoration: new BoxDecoration(
              color: Colors.redAccent,
              image: new DecorationImage(
                image: NetworkImage(
                    "http://192.168.8.101/mucassa/images/laravel-logo.png.jpg"),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.all(Radius.circular(75)),
              border: Border.all(
                color: Colors.white,
                width: 4.0,
              ),
            ),
          ),
        ),
      );
}
