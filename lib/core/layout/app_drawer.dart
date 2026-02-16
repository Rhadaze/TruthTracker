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
            child: Center(
              child: Text("Truth Tracker", style: TextStyle(fontSize: 24)),
            ),
          ),
          ListTile(
            title: Text("Home"),
            onTap: () => Navigator.of(
              context,
              rootNavigator: true,
            ).pushNamed('/home'),
          ),
          ListTile(
            title: Text("Preached At"),
            onTap: () => Navigator.of(
              context,
              rootNavigator: true,
            ).pushNamed('/preachedAt'),
          ),
          Divider(),
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
            title: Text("Churches"),
            onTap: () => Navigator.of(
              context,
              rootNavigator: true,
            ).pushNamed('/churches'),
          ),
          Divider(),
          ListTile(
            title: Text("About"),
            onTap: () =>
                Navigator.of(context, rootNavigator: true).pushNamed('/about'),
          ),
        ],
      ),
    );
  }
}
