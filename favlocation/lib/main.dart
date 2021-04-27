import 'package:flutter/material.dart';
import 'Screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fav Location',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fav Location"),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Image.asset('assests/download.jfif'),
            MyCustomForm(),
          ],
        ),
      ),
    );
  }
}
