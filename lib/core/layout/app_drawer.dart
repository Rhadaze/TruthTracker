import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

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
            onTap: () => Navigator.of(context, rootNavigator: true).pushNamed(
              '/home',
            ), //TODO trocar pushNamed por outra coisa que nao empilhe as telas infinitamente.
          ),
          ListTile(
            title: Text("Events"),
            onTap: () =>
                Navigator.of(context, rootNavigator: true).pushNamed('/events'),
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
