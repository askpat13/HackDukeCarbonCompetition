import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

String username='';

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App with MYSQL',     
      home: new MyHomePage(),
     
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

TextEditingController name=new TextEditingController();
TextEditingController email=new TextEditingController();
TextEditingController mobile=new TextEditingController();

Future<List> senddata() async {
  final response = await http.post("http://raushanjha.in/insertdata.php", body: {
    "name": name.text,
    "email": email.text,
    "mobile":mobile.text,
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register"),),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Text("Username",style: TextStyle(fontSize: 18.0),),
              TextField(   
                controller: name,                
                decoration: InputDecoration(
                  hintText: 'name'
                ),           
                ),
              Text("Email",style: TextStyle(fontSize: 18.0),),
              TextField(  
                controller: email,      
                 decoration: InputDecoration(
                  hintText: 'Email'
                ),                
                ),
                Text("Mobile",style: TextStyle(fontSize: 18.0),),
              TextField(  
                controller: mobile,        
                 decoration: InputDecoration(
                  hintText: 'Mobile'
                ),                
                ),
              
              RaisedButton(
                child: Text("Register"),
                onPressed: (){
                  senddata;
                },
              ),

             

            ],
          ),
        ),
      ),
    );
}
}