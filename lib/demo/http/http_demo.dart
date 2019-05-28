import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HttpDemo'),
        elevation: 0.0,
      ),
      body: HttpDemoHome(),
    );
  }
}

class HttpDemoHome extends StatefulWidget {
  @override
  _HttpDemoHomeState createState() => _HttpDemoHomeState();
}

class _HttpDemoHomeState extends State<HttpDemoHome> {
  @override
  void initState() {
    super.initState();
//    fetchPost();
    final post = {
      'title': 'hello',
      'description': 'nice to meet you.',
    };
    print(post['title']); //hello
    print(post['description']); //nice to meet you.

    final postJson = json.encode(post);
    print(postJson); //{"title":"hello","description":"nice to meet you."}

    final postJsonConverted = json.decode(postJson);
    print(postJsonConverted['title']); //hello
    print(postJsonConverted['description']); //nice to meet you.
    print(postJsonConverted is Map); //true

    final postModel = Post.fromJson(postJsonConverted);
    print(
        'title: ${postModel.title}, description: ${postModel.description}'); //title: hello, description: nice to meet you.

    print(
        '${json.encode(postModel)}'); //{"title":"hello","descritpion":"nice to meet you."}
  }

  fetchPost() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');
    print('statusCode:${response.statusCode}');
    print('body:${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Post {
  final String title;
  final String description;

  Post(this.title, this.description);

  Post.fromJson(Map json)
      : title = json['title'],
        description = json['description'];

//  Post.fromJson(Map json)
//      : title = json['title'],
//        description = json['description'];

  Map toJson() => {
        'title': title,
        'descritpion': description,
      };
}
