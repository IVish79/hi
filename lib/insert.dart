import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class insert extends StatefulWidget {
  const insert({Key? key}) : super(key: key);

  @override
  State<insert> createState() => _insertState();
}

class _insertState extends State<insert> {


  bool t=false;

  TextEditingController t1= TextEditingController();
  TextEditingController t2= TextEditingController();
  TextEditingController t3= TextEditingController();
  TextEditingController t4= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: t1,),
          TextField(controller: t2,),
          TextField(controller: t3,),
          TextField(controller: t4,),
          ElevatedButton(onPressed: () async {
            String name=t1.text;
            String contact=t2.text;
            String email=t3.text;
            String password=t4.text;

            //https://createworld.000webhostapp.com/register_app/insert.php
            var url = Uri.https('createworld.000webhostapp.com', 'register_app/insert.php');
            var response = await http.post(url, body: {'name': '$name', 'contact': '$contact','email':'$email','password':'$password'});
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');
            setState(() {
              t=true;
            });

            if(response.body=="data inserted")
            {
              setState(() {
                t=false;
              });
            }
            else{
              print("data not inserted");
            }
          }, child: Text("Submit")),
          t?Center(child: CircularProgressIndicator(),):Text("")
        ],
      ),
    );
  }
}