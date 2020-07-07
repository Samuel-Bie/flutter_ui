import 'package:flutter/material.dart';

class TopicpageApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: new Topicpage(),
    );
  }
}

class Topicpage extends StatefulWidget {
  @override
  _TopicpageState createState() => _TopicpageState();
}

class _TopicpageState extends State<Topicpage> {
  List users;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            title: Text('Just demo'),
            leading: Icon(Icons.arrow_back),
            expandedHeight: 480,
            pinned: true,
            floating: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Image(
                image: NetworkImage(
                    'http://192.168.8.100/mucassa/images/laravel-logo.png.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => new Card(
                child: new Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage: NetworkImage(
                            'http://192.168.8.100/mucassa/images/laravel-logo.png.jpg'),
                      ),
                      SizedBox(width: 15),
                      Text('Samuel')
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
