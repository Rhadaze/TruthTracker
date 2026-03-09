import 'package:TruthTracker/core/widgets/basic_app_card.dart';
import 'package:TruthTracker/features/venue/domain/entities/venue.dart';
import 'package:flutter/material.dart';

class VenueWidget extends StatelessWidget {
  final Venue v;

  const VenueWidget(this.v, {super.key});

  @override
  Widget build(BuildContext context) {
    return BasicAppCard(
      leadingIcon: Icons.access_time,
      title: v.name,
      subtitle: "Bairro ${v.neighborhood} em ${v.city}.\n${v.denomination}",
      trailingIcon: Icons.menu,
      onTap: () {
        print("hi");
      },
    );
  }

  static List<VenueWidget> fromList(List<Venue> churches) {
    return churches.map((c) => VenueWidget(c)).toList();
  }
}
