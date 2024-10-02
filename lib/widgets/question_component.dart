import 'package:dog_license_application/models/response/post_response_model.dart';
import 'package:flutter/material.dart';

class QuestionComponent extends StatelessWidget {
  final Post post;
  final  void Function()? onTap;
  const QuestionComponent({
    super.key,
    this.onTap,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(post.title),
        subtitle: Text(
          post.text,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
