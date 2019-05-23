import 'package:aiyi_flutter_demo_app/model/Post.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    );
  }
}

class Home extends StatelessWidget {
  Widget _listItemBuilder(BuildContext context, int index) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Image.network(posts[index].imageUrl),
          SizedBox(height: 16.0),
          Text(
            posts[index].title,
            style: Theme.of(context).textTheme.title,
          ),
          Text(
            posts[index].author,
            style: Theme.of(context).textTheme.subhead,
          ),
          SizedBox(
            height: 16.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('aiyi'),
          elevation: 10.0,
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: _listItemBuilder,
        ));
  }
}

class Hello extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'hello',
        textDirection: TextDirection.ltr,
        style: TextStyle(
            fontSize: 36.0, fontWeight: FontWeight.bold, color: Colors.red),
      ),
    );
  }
}
