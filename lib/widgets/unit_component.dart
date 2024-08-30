import 'package:cached_network_image/cached_network_image.dart';
import 'package:dog_license_application/constants/theme_constants.dart';
import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/models/response/unit_response_model.dart';
import 'package:dog_license_application/views/lessons_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UnitComponent extends StatelessWidget {
  final UnitResponseModel model;

  const UnitComponent({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () => Get.toNamed(LessonsView.id, arguments: model),
      child: Container(
        height: 220,
        width: width,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 1.15),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 125,
              width: width,
              child: /*Image.network(
                model.imageUrl,
                fit: BoxFit.cover,
                alignment: const Alignment(0, -0.5),
              ),*/
              CachedNetworkImage(
                imageUrl: model.imageUrl,
                fit: BoxFit.cover,
                alignment: const Alignment(0, -0.5),
                placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => const Icon(Icons.error, color: kPrimaryColor),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 10),
                const Icon(Icons.book, color: kPrimaryColor, size: 28),
                const SizedBox(width: 5),
                Text(
                  model.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                const Icon(Icons.arrow_forward, color: kPrimaryColor, size: 25, weight: 3),
                const SizedBox(width: 15),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                const SizedBox(width: 14),
                const Icon(Icons.check_circle, color: kPrimaryColor, size: 20),
                const SizedBox(width: 10),
                Text(
                  "${S.of(context).home_view__completed} ${model.completedLessons} ${S.of(context).home_view__out_of} ${model.totalLessons} ${S.of(context).home_view__lessons}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
