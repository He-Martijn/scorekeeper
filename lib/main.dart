import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  print('void main is called');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Is the following true?',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: MyBodyApp(),
      ),
    );
  }
}

class MyBodyApp extends StatefulWidget {
  const MyBodyApp({Key? key}) : super(key: key);

  @override
  _MyBodyAppState createState() => _MyBodyAppState();
}

class _MyBodyAppState extends State<MyBodyApp> {

  List <Icon> scoreKeeper = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
              child: Center(
                child: Text('Good question',
                style: TextStyle(
                  color: Colors.white,
                  ),
                ),
              ),
          ),
          Expanded(
            flex: 1,
              child: TextButton(
                onPressed: (){
                  print('true is pressed');
                  setState(() {
                    scoreKeeper.add(Icon(Icons.check, color: Colors.green,),);
                  });
                },
                child: Container(
                  width: 200.0,
                  height: 75.0,
                  color: Colors.green,
                  child: Center(
                    child: Text('true',
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                  ),
                ),
              ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: (){
                print('false is pressed');
                setState(() {
                  scoreKeeper.add(Icon(Icons.close,color: Colors.red,),);
                });
              },
              child: Container(
                width: 200.0,
                height: 75.0,
                color: Colors.red,
                child: Center(
                  child: Text('false',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                ),
              ),
            ),
          ),
          Row (children: scoreKeeper),
        ],
      )
    );
  }
}

