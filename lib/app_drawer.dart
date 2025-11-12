import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue[100]),
            child: Text("Menu", style: TextStyle(fontSize: 24)),
          ),
          ListTile(
            title: Text("Sermons"),
            onTap: () => Navigator.of(
              context,
              rootNavigator: true,
            ).pushNamed('/sermons'),
          ),
          ListTile(
            title: Text("Preachers"),
            onTap: () => Navigator.of(
              context,
              rootNavigator: true,
            ).pushNamed('/preachers'),
          ),
          ListTile(
            title: Text("Preached At"),
            onTap: () => Navigator.of(
              context,
              rootNavigator: true,
            ).pushNamed('/preachedAt'),
          ),
          ListTile(
            title: Text("Churches"),
            onTap: () => Navigator.of(
              context,
              rootNavigator: true,
            ).pushNamed('/churches'),
          ),
        ],
      ),
    );
  }
}
