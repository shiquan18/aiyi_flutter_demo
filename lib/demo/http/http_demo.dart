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
//    fetchPost().then((value) => print('result  value =$value'));
//    final post = {
//      'title': 'hello',
//      'description': 'nice to meet you.',
//    };
//    print(post['title']); //hello
//    print(post['description']); //nice to meet you.
//
//    final postJson = json.encode(post);
//    print(postJson); //{"title":"hello","description":"nice to meet you."}
//
//    final postJsonConverted = json.decode(postJson);
//    print(postJsonConverted['title']); //hello
//    print(postJsonConverted['description']); //nice to meet you.
//    print(postJsonConverted is Map); //true
//
//    final postModel = Post.fromJson(postJsonConverted);
//    print(
//        'title: ${postModel.title}, description: ${postModel.description}'); //title: hello, description: nice to meet you.
//
//    print(
//        '${json.encode(postModel)}'); //{"title":"hello","descritpion":"nice to meet you."}
  }

  Future<List<Post>> fetchPost() async {
    final response =
        await http.get('https://resources.ninghao.net/demo/posts.json');

//    print('statusCode:${response.statusCode}');
//    print('body:${response.body}');

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body);
//      print('responseBody:$responseBody');
      List<Post> posts = responseBody['posts']
          .map<Post>((item) => Post.fromJson(item))
          .toList();
//      for (int i = 0; i < posts.length; i++) {
//        print('title:${posts[i].title}');
//        print('author:${posts[i].author}');
//      }

      return posts;
    } else {
      throw Exception('Failed to fetch posts.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: fetchPost(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print('data: ${snapshot.data}');
          print('connectionState: ${snapshot.connectionState}');
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text('loading...'),
            );
          }
          return ListView(
            children: snapshot.data.map<Widget>((item) {
              return ListTile(
                title: Text(item.title),
                subtitle: Text(item.author),
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(item.imageUrl),
                ),
              );
            }).toList(),
          );
        });
  }
}

class Post {
  final int id;
  final String title;
  final String description;
  final String author;
  final String imageUrl;

  Post(
    this.id,
    this.title,
    this.description,
    this.author,
    this.imageUrl,
  );

  Post.fromJson(Map json)
      : id = json['id'],
        title = json['title'],
        description = json['description'],
        author = json['author'],
        imageUrl = json['imageUrl'];

  Map toJson() => {
        'id': id,
        'title': title,
        'descritpion': description,
        'author': author,
        'imageUrl': imageUrl,
      };
}
