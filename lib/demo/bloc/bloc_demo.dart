import 'package:aiyi_flutter_demo_app/demo/bloc/counter_bloc_demo.dart';
import 'package:flutter/material.dart';

class BlocDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BlocDemo'),
        elevation: 2.0,
      ),
      body: CounterHome(),
      floatingActionButton: CounterActionButton(),
    );
  }
}
