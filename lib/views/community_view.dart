import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/widgets/drawer_component.dart';
import 'package:dog_license_application/widgets/reusable_fab.dart';
import 'package:flutter/material.dart';

class CommunityView extends StatelessWidget {
  static const String id = "/CommunityView";

  const CommunityView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).community_view__title),
      ),
      drawer: const DrawerComponent(),
      floatingActionButton: ReusableFAB(
        icon: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
