import 'package:TruthTracker/features/preacher/domain/entities/preacher.dart';
import 'package:TruthTracker/core/widgets/basic_app_card.dart';
import 'package:flutter/material.dart';

class PreacherWidget extends StatelessWidget {
  final Preacher preacher;

  const PreacherWidget(this.preacher);

  @override
  Widget build(BuildContext context) {
    return BasicAppCard(
      leadingIcon: Icons.person,
      title: preacher.name,
      subtitle: preacher.denomination ?? '',
      trailingIcon: Icons.menu,
      onTap: () {
        print("hi");
      },
    );
    //throw UnimplementedError();
  }

  static List<PreacherWidget> fromList(List<Preacher> plist) {
    return plist.map((p) => PreacherWidget(p)).toList();
  }
}
