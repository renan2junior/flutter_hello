import 'package:flutter/material.dart';
import 'package:hellow/models/house.dart';
import 'package:hellow/pages/house.dart';
import 'package:hellow/utils/nav.dart';

class HelloListview extends StatefulWidget {
  HelloListview({Key key}) : super(key: key);

  @override
  _HelloListviewState createState() => _HelloListviewState();
}

class _HelloListviewState extends State<HelloListview> {
  bool _gridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: () {
              setState(() {
                _gridView = false;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.grid_on),
            onPressed: () {
              setState(() {
                _gridView = true;
              });
            },
          )
        ],
      ),
      body: _body(),
    );
  }

  _body() {
    List<House> houses = [
      House("Greyjoy", "assets/images/casa1.png"),
      House("Tully", "assets/images/casa2.png"),
      House("Baratheon", "assets/images/casa3.png"),
      House("Lannister", "assets/images/casa4.png"),
      House("Stark", "assets/images/casa5.png"),
      House("Targaryen", "assets/images/casa6.png"),
    ];
    print(_gridView);
    if (!_gridView) {
      return ListView.builder(
          itemCount: houses.length,
          itemExtent: 400,
          itemBuilder: (BuildContext context, int index) {
            House house = houses[index];
            return _stack(house);
          });
    } else {
      return GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: houses.length,
        itemBuilder: (BuildContext context, int index) {
          House house = houses[index];
          return _stack(house);
        },
      );
    }
  }

  _stack(House house) {
    return GestureDetector(
      onTap: () {
        push(context, HousePage(house));
      },
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          img(house.foto),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: EdgeInsets.all(12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.black45,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Text(
                house.nome,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  img(String image) {
    return Image.asset(
      image,
      fit: BoxFit.contain,
    );
  }
}
