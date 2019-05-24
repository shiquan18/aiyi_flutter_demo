import 'package:flutter/material.dart';

class BasicDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ContainerBoxDecorationDemo();
  }
}

class ContainerBoxDecorationDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
//      color: Colors.grey[100],
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://resources.ninghao.org/images/say-hello-to-barry.jpg'),
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.indigoAccent[400].withOpacity(0.5),
            BlendMode.hardLight,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: Icon(Icons.pool, size: 32.0, color: Colors.white),
//            color: Color.fromRGBO(3, 55, 255, 1.0),
            padding: EdgeInsets.all(0.0),
            margin: EdgeInsets.all(8.0),
            width: 90.0,
            height: 90.0,
            decoration: BoxDecoration(
                color: Color.fromRGBO(3, 54, 255, 1.0),
                border: Border.all(
                    //边框
                    color: Colors.indigoAccent[100],
                    width: 3.0,
                    style: BorderStyle.solid),
                borderRadius: BorderRadius.circular(16.0),
                //圆角
                boxShadow: [
                  //阴影
                  BoxShadow(
                    offset: Offset(0.0, 16.0), //偏移度
                    color: Color.fromRGBO(16, 20, 188, 1.0),
                    blurRadius: 35.0, //范围
                    spreadRadius: -9.0, //淡度
                  ),
                ],
                shape: BoxShape.rectangle,
                //形状
                gradient: LinearGradient(colors: [
                  //渐变
                  Color.fromRGBO(7, 102, 255, 1.0),
                  Color.fromRGBO(3, 28, 128, 1.0),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          ),
        ],
      ),
    );
  }
}

class RichTextDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: 'aiyi',
        style: TextStyle(
            color: Colors.deepPurpleAccent,
            fontSize: 34.0,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w100),
        children: [
          TextSpan(
            text: 'net',
            style: TextStyle(fontSize: 16.0, color: Colors.grey),
            children: [
              TextSpan(
                text: 'net',
                style: TextStyle(fontSize: 12.0, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class TextDemo extends StatelessWidget {
  final TextStyle _textStyle = TextStyle(
    fontSize: 16.0,
  );
  final String _author = '李白';
  final String _title = '将敬酒';

  @override
  Widget build(BuildContext context) {
    return Text(
      '<$_author->-56-<$_title>君不见黄河之水天上来，奔流到海不复回。君不见高堂明镜悲白发，朝如青丝暮成雪。人生得意须尽欢，莫使金樽空对月。天生我材必有用，千金散尽还复来。烹羊宰牛且为乐，会须一饮三百杯。',
      textAlign: TextAlign.left,
      style: _textStyle,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    );
  }
}
