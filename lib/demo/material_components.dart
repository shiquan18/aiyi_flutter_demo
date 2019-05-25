import 'package:flutter/material.dart';

class MaterialComponents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MaterialComponents'), elevation: 2.0),
      body: ListView(
        children: <Widget>[
          ListItem(
              title: 'FloatingActionButton', page: FloatingActionButtonDemo()),
        ],
      ),
    );
  }
}

class FloatingActionButtonDemo extends StatelessWidget {
  final Widget _floatingActionButtonExtended = FloatingActionButton.extended(
      onPressed: () {}, icon: Icon(Icons.add), label: Text('add'));

  final Widget _floatingActionButton = FloatingActionButton(
    onPressed: () {},
    child: Icon(Icons.add),
    elevation: 0.0,
    backgroundColor: Colors.black87,
    shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('FloatingActionButtonDemo'), elevation: 2.0),
      floatingActionButton: _floatingActionButton,
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final Widget page;

  ListItem({this.title, this.page});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
    );
  }
}
