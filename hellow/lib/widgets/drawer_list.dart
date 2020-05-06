import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Renan Junior"),
              accountEmail: Text("renan2junior@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/images/casa2.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.poll),
              title: Text("Piscina"),
            ),
            ListTile(
              leading: Icon(Icons.polymer),
              title: Text("Outros"),
            ),
            ListTile(
              leading: Icon(Icons.power_input),
              title: Text("Qualquer"),
              subtitle: Text("Mesmo"),
              trailing: Icon(Icons.arrow_forward),
              onTap: ()=> Navigator.pop(context),
            )
          ],
        ),
      ),
    );
  }
}
