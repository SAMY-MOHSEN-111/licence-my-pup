import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/widgets/drawer_component.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  static const String id = "/HomeView";

  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).home_view__title),
      ),
      drawer: const DrawerComponent(),
      body: const Column(
        children: [
          Text('Home View'),
        ],
      ),
    );
  }
}
