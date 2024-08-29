import 'package:dog_license_application/constants/theme_constants.dart';
import 'package:dog_license_application/models/response/lesson_response_model.dart';
import 'package:dog_license_application/views/lesson_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LessonComponent extends StatelessWidget {
  final int unitId;
  final LessonResponseModel lesson;

  const LessonComponent({
    super.key,
    required this.unitId,
    required this.lesson,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kPrimaryColor,
      child: Tooltip(
        message: lesson.name,
        decoration: BoxDecoration(
          color: const Color(0xff111827),
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          onTap: () => Get.toNamed(LessonView.id, arguments: {"unitId": unitId, "lesson": lesson}),
          title: Text(
            lesson.name,
            style: const TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
          ),
          trailing: lesson.passed
              ? Container(
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.check_circle, color: Colors.green),
                )
              : const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 18),
        ),
      ),
    );
  }
}
