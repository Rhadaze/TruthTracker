import 'package:flutter/material.dart';

class BasicAppCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final void Function()? onTap;

  const BasicAppCard({
    this.title = 'Default Title',
    this.subtitle = '',
    this.leadingIcon = Icons.account_box,
    this.trailingIcon = Icons.menu,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: ListTile(
        isThreeLine: false,
        tileColor: Colors.blue[100],
        hoverColor: Colors.green[300],
        focusColor: Colors.blue[800],
        selectedColor: Colors.amber[800],
        leading: SizedBox(
          height: 88,
          width: 56,
          child: Center(child: Icon(leadingIcon)),
        ),
        title: Text(title),
        subtitle: subtitle.isEmpty ? null : Text(subtitle),
        trailing: SizedBox(
          height: 88,
          width: 56,
          child: Center(child: Icon(trailingIcon)),
        ),
        onTap: onTap,
      ),
    );
  }
}
