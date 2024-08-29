import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UnitComponentSkeleton extends StatelessWidget {
  const UnitComponentSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: 220,
        width: width,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.black, width: 1.15),
          color: Colors.grey.shade300, // Gives the shimmer color
        ),
      ),
    );
  }
}
