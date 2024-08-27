import 'package:dog_license_application/constants/theme_constants.dart';
import 'package:flutter/material.dart';

class ReusableFAB extends StatelessWidget {
  final Icon icon;
  final void Function()? onPressed;
  final Color? backgroundColor;

  const ReusableFAB({
    super.key,
    required this.icon,
    required this.onPressed,
    this.backgroundColor = kPrimaryColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: IconButton(
        icon: icon,
        onPressed: onPressed,
      ),
    );
  }
}
