import 'package:flutter/material.dart';

class StreamDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('StreamDemo'),
        elevation: 0.0,
      ),
      body: StreamDemoHome(),
    );
  }
}

class StreamDemoHome extends StatefulWidget {
  @override
  _StreamDemoHomeState createState() => _StreamDemoHomeState();
}

class _StreamDemoHomeState extends State<StreamDemoHome> {
  @override
  void initState() {
    super.initState();
    print('create a stream');
    Stream<String> _streamDemo = Stream.fromFuture(fetchData());

    print('Start listening on a stream.');
    _streamDemo.listen(onData, onError: onError, onDone: onDone);

    print('Initialize completed.');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<String> fetchData() async {
    await Future.delayed(Duration(seconds: 3));
    throw 'Something happened';
  }

  void onData(String data) {
    print('$data');
  }

  void onDone() {
    print('Done!');
  }

  void onError(error) {
    print('Error: $error');
  }
}
