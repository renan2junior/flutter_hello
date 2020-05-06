import 'package:flutter/material.dart';

class HelloPage2 extends StatelessWidget {
  const HelloPage2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 2"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context){
    return Center(
        child: _button(context),
      );
  }

  _button(BuildContext context) {
    return RaisedButton(
      child: Text("Voltar"),
      onPressed: () => _voltar(context),
    );
  }

  void _voltar(BuildContext context) {
    Navigator.pop(context, "Tala 2");
  }
}
