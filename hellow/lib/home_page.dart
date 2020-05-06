import 'package:flutter/material.dart';
import 'package:hellow/pages/hello_listview.dart';
import 'package:hellow/pages/hello_page2.dart';
import 'package:hellow/pages/hello_page3.dart';
import 'package:hellow/widgets/blue_button.dart';
import 'package:hellow/utils/nav.dart';
import 'package:hellow/widgets/drawer_list.dart';
import 'package:toast/toast.dart';

class HomePAge extends StatelessWidget {
  const HomePAge({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Hellow App",
            style: TextStyle(
              backgroundColor: Colors.red,
              fontStyle: FontStyle.italic,
            ),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: "tab 1",
              ),
              Tab(
                text: "tab 2",
              ),
              Tab(
                text: "tab 2",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            _body(),
            Container(
              color: Colors.teal,
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => print("OLA!!!"),
        ),
        drawer: DrawerList(),
      ),
    );
  }

  _body() {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          _text(),
          _pages(),
          _buttons(),
        ],
      ),
    );
  }



  _onClickSnack(BuildContext context) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text("Ola Flutter"),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Ola!!"),
          actions: <Widget>[
            FlatButton(
              child: Text("Cancelar"),
              onPressed: () => Navigator.pop(context),
            ),
            FlatButton(
              child: Text("OH"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }

  _onClickToast(BuildContext context) {
    Toast.show("Toast plugin app", context,
        duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
  }

  void _onClickPage(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print(s);
  }

_text() {
    return Expanded(
          flex: 0,
          child: Text(
        "Game of Thrones",
        style: TextStyle(
          color: Colors.brown,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  _pages() {
    return Expanded(
          flex: 2,
          child: Container(
            color: Colors.red,
        height: 300,
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: PageView(
          children: <Widget>[
            _img("assets/images/casa1.png"),
            _img("assets/images/casa2.png"),
            _img("assets/images/casa3.png"),
            _img("assets/images/casa4.png"),
            _img("assets/images/casa5.png"),
          ],
        ),
      ),
    );
  }

  _buttons() {
    return Expanded(
          flex:0,
          child: Builder(
        builder: (BuildContext context) {
          return Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  BlueButton(
                      "Listview", () => _onClickPage(context, HelloListview())),
                  BlueButton("page 2", () => _onClickPage(context, HelloPage2())),
                  BlueButton("page 3", () => _onClickPage(context, HelloPage3())),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  BlueButton("Snack", () => _onClickSnack(context)),
                  BlueButton("Dialog", () => _onClickDialog(context)),
                  BlueButton("Toast", () => _onClickToast(context)),
                ],
              )
            ],
          );
        },
      ),
    );
  }

  _img(String image) {
    return Image.asset(image, fit: BoxFit.contain);
  }

  
}
