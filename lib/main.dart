import 'package:aiyi_flutter_demo_app/demo/basic_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/bottom_navigation_bar_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/drawer_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/form_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/layout_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/listview_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/material_components.dart';
import 'package:aiyi_flutter_demo_app/demo/navigat_ordemo.dart';
import 'package:aiyi_flutter_demo_app/demo/sliver_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/state/state_management_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/stream/stream_demo.dart';
import 'package:aiyi_flutter_demo_app/demo/view_demo.dart';
import 'package:aiyi_flutter_demo_app/model/Post.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamDemo(),
//      initialRoute: '/stream',
//      routes: {
//        '/': (context) => Home(),
//        '/about': (context) => Page(title: 'About'),
//        '/form': (context) => FroDemo(),
//        '/mdc': (context) => MaterialComponents(),
//        '/state-management': (context) => StateManagementDemo(),
//        '/stream': (context) => StreamDemo(),
//      },
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        highlightColor: Color.fromRGBO(255, 255, 255, 0.5),
        splashColor: Colors.white70,
        accentColor: Color.fromRGBO(3, 55, 255, 1.0),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text('aiyi'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'search',
              onPressed: () => debugPrint('search button is pressed.'),
            ),
          ],
          elevation: 1.0,
          bottom: TabBar(
            unselectedLabelColor: Colors.black38,
            indicatorColor: Colors.black45,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorWeight: 3.0,
            tabs: <Widget>[
              Tab(icon: Icon(Icons.local_florist)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.change_history)),
              Tab(icon: Icon(Icons.directions_bike))
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListViewDemo(),
            BasicDemo(),
            LayoutDemo(),
            SliverDemo(),
//            Icon(Icons.change_history, size: 128.0, color: Colors.red),
//            Icon(Icons.change_history, size: 128.0, color: Colors.white),
//            Icon(Icons.directions_bike, size: 128.0, color: Colors.black12),
          ],
        ),
        drawer: DrawerDemo(),
//        bottomNavigationBar: BottomNavigationBarDemo(),
      ),
    );
  }
}
