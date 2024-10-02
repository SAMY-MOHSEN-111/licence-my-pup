import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_license_application/constants/theme_constants.dart';
import 'package:dog_license_application/cubits/lessons_cubit/lessons_cubit.dart';
import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/models/response/unit_response_model.dart';
import 'package:dog_license_application/views/exam_view.dart';
import 'package:dog_license_application/widgets/lesson_component.dart';
import 'package:dog_license_application/widgets/reusable_fab.dart';
import 'package:dog_license_application/widgets/shimmers/lessons_shimmer_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class LessonsView extends StatefulWidget {
  static const String id = "/LessonsView";

  const LessonsView({super.key});

  @override
  State<LessonsView> createState() => _LessonsViewState();
}

class _LessonsViewState extends State<LessonsView> {
  var model = Get.arguments as UnitResponseModel;

  @override
  void initState() {
    super.initState();
    _loadLessons();  // Initial load of lessons
  }

  // Method to reload lessons (used for pull-to-refresh)
  Future<void> _loadLessons() async {
    BlocProvider.of<LessonsCubit>(context).getLessonsByUnitId(model.id);
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    var bloc = BlocProvider.of<LessonsCubit>(context);

    return BlocBuilder<LessonsCubit, LessonsState>(
      builder: (context, state) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: _loadLessons, // Trigger refresh action
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(), // Allow scroll even when content is less
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    width: width,
                    child: CachedNetworkImage(
                      imageUrl: model.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: kPrimaryColor),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        model.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      model.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                      child: Text(
                        S.of(context).lessons_view__lessons,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  ListView.separated(
                    physics: const NeverScrollableScrollPhysics(), // Disable inner list scroll
                    shrinkWrap: true, // Shrink to fit content size
                    padding: const EdgeInsets.all(8),
                    itemCount: bloc.isLoading ? 4 : bloc.lessons.length,
                    itemBuilder: (context, index) {
                      return bloc.isLoading
                          ? const LessonComponentSkeleton()
                          : LessonComponent(unitId: model.id, lesson: bloc.lessons[index]);
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 10);
                    },
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: Tooltip(
            message: S.of(context).lessons_view__take_exam,
            decoration: BoxDecoration(
              color: const Color(0xff111827),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ReusableFAB(
              onPressed: () => Get.toNamed(ExamView.id, arguments: model.id),
              icon: const Icon(Icons.book),
            ),
          ),
        );
      },
    );
  }
}

