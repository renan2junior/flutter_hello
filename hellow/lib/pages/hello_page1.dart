import 'package:flutter/material.dart';

class HelloPage1 extends StatelessWidget {
  const HelloPage1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 1"),
      ),
      body: Text("Page 1"),
    );
  }

}
