import 'package:flutter/material.dart';
import 'API.dart';
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String url;
  var Data;

  String QueryText = 'Query';
  TextEditingController searchEditor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('PYTHON AND FLUTTER'),
        ),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                onChanged: (value) {
                  url = 'http://192.168.1.5:5000/api';
                },
                decoration: InputDecoration(
                    hintText: 'Search Anything Here',
                    suffixIcon: GestureDetector(
                        onTap: () async{
                          Data = await Getdata(url);
                          var DecodedData = jsonDecode(Data);
                          setState(() {
                            QueryText = DecodedData['Query'];
                          });
    Future.delayed(Duration(microseconds: 500),(){   //call back after 500  microseconds
    searchEditor.clear();  // clear textfield
    });
  },
                        child: Icon(Icons.search))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                QueryText,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
