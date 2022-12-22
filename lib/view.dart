import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class view extends StatefulWidget {
  const view({Key? key}) : super(key: key);

  @override
  State<view> createState() => _viewState();
}

class _viewState extends State<view> {
  @override
  void initState() {
    super.initState();
    get();
  }

  List l = [];

  get() async {
    //https://createworld.000webhostapp.com/register_app/view.php

    var url = Uri.https('createworld.000webhostapp.com', 'register_app/view.php');

    var response = await http.get(url);
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    l = jsonDecode(response.body.toString());

    // print(l);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
        future: get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Please wait loading..."));
          } else {
            if (snapshot.hasError) {
              return Center(child: Text('Error:${snapshot.error}'));
            } else {
              return Center(
                  child: ListView.builder(
                    itemCount: l.length,
                    itemBuilder: (context, index) {

                      Myclass m = Myclass.fromJson(l[index]);
                      return ListTile(
                        leading: Text("${m.id}"),
                        title: Text(
                          "${m.name}",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("${m.email}"),
                        trailing: Text("${m.contact}"),
                      );
                    },
                  ));
            }
          }
        },
      ),
    );
  }
}

class Myclass {
  String? id;
  String? name;
  String? email;
  String? contact;
  String? password;

  Myclass({this.id, this.name, this.email, this.contact, this.password});

  Myclass.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    contact = json['contact'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['contact'] = this.contact;
    data['password'] = this.password;
    return data;
  }
}