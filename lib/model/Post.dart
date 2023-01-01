

import 'dart:convert';
import 'dart:js';
import 'dart:math';

List<Post> listFromJson(String str)=>
    List<Post>.from(json.decode(str).map((e)=>Post.fromJson(e)));

class Post {
  Post({
      this.userId, 
      this.id, 
      this.title, 
      this.body,});

  Post.fromJson(dynamic json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
  int? userId;
  int? id;
  String? title;
  String? body;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userId'] = userId;
    map['id'] = id;
    map['title'] = title;
    map['body'] = body;
    return map;
  }

}