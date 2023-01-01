import 'dart:core';

import 'package:flutter/material.dart';
import 'package:jsonplaceholder/network_service.dart';

import 'model/Post.dart';

void main() {
  runApp(MaterialApp(home: MyApp(),));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
late Future<List<Post>> posts;

@override
void initState(){
  posts=NetworkService().loadData();
  super.initState();
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
 appBar: AppBar(
   title: Text("Retrofit"),
 ),
      body: FutureBuilder(
          future: posts,
          builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot){
        if(snapshot.hasData){
          return ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index){
      return Container(
      color: Colors.black26,

      margin: EdgeInsets.all(10),
      height: 200,
      child: Column(
      children: [
      Text(snapshot.data![index].userId.toString() ),
      Text(snapshot.data![index].id.toString()),
      Text(snapshot.data![index].title.toString()),
      Text(snapshot.data![index].body.toString()),
      ],
      )
      );
      });
      }
        else
          {
            return Center(
            child: CircularProgressIndicator(),
            );
          }
      })
    );
  }
}

