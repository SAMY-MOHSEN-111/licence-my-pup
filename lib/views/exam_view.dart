import 'package:dog_license_application/cubits/exams_cubit/exams_cubit.dart';
import 'package:dog_license_application/widgets/exam_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ExamView extends StatefulWidget {
  static String id = "/ExamView";

  const ExamView({super.key});

  @override
  State<ExamView> createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  var unitId = Get.arguments as int;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ExamsCubit>(context).getExamsByUnitId(unitId);
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<ExamsCubit>(context);
    return Scaffold(
      appBar: AppBar(title: const Text("Exam")),
      body: BlocBuilder<ExamsCubit, ExamState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: ExamComponent(unitId: unitId, questions: bloc.questions),
          );
        },
      ),
    );
  }
}
