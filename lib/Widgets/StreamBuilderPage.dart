import 'dart:async';

import 'package:flutter/material.dart';

class StreamBuilderWidget extends StatelessWidget {
  const StreamBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int counter = 0;
  StreamController<int> counterController = StreamController<int>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: StreamBuilder(
            stream: counterController.stream,
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return Text(snapshot.data.toString(), style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),);
              }else{
                return Text("0", style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold),);
              }
            },
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          counter++;
          counterController.sink.add(counter);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
