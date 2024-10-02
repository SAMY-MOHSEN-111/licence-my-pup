import 'package:dog_license_application/cubits/scores_cubit/scores_cubit.dart';
import 'package:dog_license_application/widgets/drawer_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ScoresView extends StatefulWidget {
  static const String id = "/ScoresView";

  const ScoresView({super.key});

  @override
  State<ScoresView> createState() => _ScoresViewState();
}

class _ScoresViewState extends State<ScoresView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ScoresCubit>(context).getTrials();
  }

  String formatDateTime(String dateTime) {
    final date = DateTime.parse(dateTime);
    return DateFormat('yyyy-MM-dd HH:mm').format(date);
  }

  Future<void> _refreshScores() async {
    BlocProvider.of<ScoresCubit>(context).getTrials();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ScoresCubit>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Scores")),
      drawer: const DrawerComponent(),
      body: BlocBuilder<ScoresCubit, ScoresState>(
        builder: (context, state) {
          if (state is ScoresLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ScoresSuccess) {
            var trials = bloc.trials;
            return RefreshIndicator(
              onRefresh: _refreshScores,
              child: ListView.separated(
                padding: const EdgeInsets.all(8.0),
                itemCount: trials.length,
                itemBuilder: (BuildContext context, int index) {
                  var trial = trials[index];
                  return Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ListTile(
                      leading: Icon(
                        Icons.school_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                      title: Text(
                        trial.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Score: ${trial.score.toStringAsFixed(2)}%"),
                          Text("Completed at: ${formatDateTime(trial.completedAt)}"),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },
              ),
            );
          } else {
            return const Center(child: Text('No data found.'));
          }
        },
      ),
    );
  }
}
