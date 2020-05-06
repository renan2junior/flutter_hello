import 'package:flutter/material.dart';
import 'package:hellow/models/house.dart';

class HousePage extends StatelessWidget {
  // const House({Key key}) : super(key: key);

  final House house;

  HousePage(this.house);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(house.nome),
      ),
      body: Image.asset(house.foto),
    );
  }
}
