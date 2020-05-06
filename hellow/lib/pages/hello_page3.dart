import 'package:flutter/material.dart';
import 'package:hellow/widgets/blue_button.dart';

class HelloPage3 extends StatelessWidget {
  const HelloPage3({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Page 3"),
      ),
      body: _body(context),
    );
  }

  _body(BuildContext context){
    return Center(
        child: BlueButton("Voltar", () => _voltar(context)),
      );
  }

  void _voltar(BuildContext context) {
    Navigator.pop(context, "Tala 3");
  }
}
