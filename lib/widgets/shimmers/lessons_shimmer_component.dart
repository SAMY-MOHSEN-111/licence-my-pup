import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LessonComponentSkeleton extends StatelessWidget {
  const LessonComponentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Card(
        color: Colors.grey[850],
        child: Container(height: 60.0),
      ),
    );
  }
}
