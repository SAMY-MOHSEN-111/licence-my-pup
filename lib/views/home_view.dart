import 'package:dog_license_application/cubits/units_cubit/units_cubit.dart';
import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/widgets/drawer_component.dart';
import 'package:dog_license_application/widgets/shimmers/unit_shimmer_component.dart';
import 'package:dog_license_application/widgets/unit_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  static const String id = "/HomeView";

  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UnitsCubit>(context).getAllUnits();
  }

  Future<void> _refreshUnits() async {
    BlocProvider.of<UnitsCubit>(context).getAllUnits(); // Refresh the units
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UnitsCubit, UnitsState>(
      builder: (context, state) {
        var bloc = BlocProvider.of<UnitsCubit>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).home_view__title),
          ),
          drawer: const DrawerComponent(),
          body: RefreshIndicator(
            onRefresh: _refreshUnits, // Set the refresh function
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    Expanded(
                      child: ListView.separated(
                        itemCount: bloc.isLoading ? 3 : bloc.units.length,
                        itemBuilder: (context, index) {
                          return bloc.isLoading
                              ? const UnitComponentSkeleton()
                              : UnitComponent(model: bloc.units[index]);
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(height: 15);
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
