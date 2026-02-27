import 'package:TruthTracker/core/widgets/basic_app_card.dart';
import 'package:TruthTracker/features/venue/domain/entities/venue.dart';
import 'package:flutter/material.dart';

class ChurchWidget extends StatelessWidget {
  final Venue c;

  const ChurchWidget(this.c, {super.key});

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
  }

  static List<ChurchWidget> fromList(List<Venue> churches) {
    return churches.map((c) => ChurchWidget(c)).toList();
  }
}
