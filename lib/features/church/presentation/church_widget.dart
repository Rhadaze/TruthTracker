import 'package:TruthTracker/core/widgets/basic_app_card.dart';
import 'package:TruthTracker/features/church/domain/entities/church.dart';
import 'package:flutter/material.dart';

class ChurchWidget extends StatelessWidget {
  final Church c;

  const ChurchWidget(this.c);

  @override
  Widget build(BuildContext context) {
    return BasicAppCard(
      leadingIcon: Icons.access_time,
      title: c.name,
      subtitle: "Bairro ${c.bairro} em ${c.cidade}.\n${c.denominacao}",
      trailingIcon: Icons.menu,
      onTap: () {
        print("hi");
      },
    );
    //throw UnimplementedError();
  }

  static List<ChurchWidget> fromList(List<Church> churches) {
    return churches.map((c) => ChurchWidget(c)).toList();
  }
}
