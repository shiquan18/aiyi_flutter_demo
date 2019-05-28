import 'package:flutter/material.dart';

class AnimationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimationDemo'),
        elevation: 0.0,
      ),
      body: AnimationDemoHome(),
    );
  }
}

class AnimationDemoHome extends StatefulWidget {
  @override
  _AnimationDemoHomeState createState() => _AnimationDemoHomeState();
}

class _AnimationDemoHomeState extends State<AnimationDemoHome>
    with TickerProviderStateMixin {
  AnimationController animationDemoController;
  CurvedAnimation curve;
  Animation animation;
  Animation animationColor;

  @override
  void initState() {
    super.initState();
    animationDemoController = AnimationController(
//      value: 32.0,
//      lowerBound: 32.0,
//      upperBound: 100.0,
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    curve = CurvedAnimation(
        parent: animationDemoController, curve: Curves.bounceOut);
    animation = Tween(begin: 32.0, end: 100.0).animate(curve);
    animationColor =
        ColorTween(begin: Colors.red, end: Colors.red[900]).animate(curve);
    animationDemoController.addListener(() {
//      print('${animationDemoController.value}');
      setState(() {});
    });
//    animationDemoController.forward();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
          icon: Icon(Icons.favorite),
          iconSize: animation.value,
          color: animationColor.value,
          onPressed: () {
            switch (animationDemoController.status) {
              case AnimationStatus.completed:
                animationDemoController.reverse();
                break;
              default:
                animationDemoController.forward();
            }
          }),
    );
  }
}
