import 'package:dog_license_application/cubits/posts_cubit/posts_cubit.dart';
import 'package:dog_license_application/models/request/create_post_request_model.dart';
import 'package:dog_license_application/validators/required_field_validator.dart';
import 'package:dog_license_application/widgets/input_field_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePostDialog extends StatefulWidget {
  const CreatePostDialog({super.key});

  @override
  State<CreatePostDialog> createState() => _CreatePostDialogState();
}

class _CreatePostDialogState extends State<CreatePostDialog> {
  final GlobalKey<FormState> globalKey = GlobalKey();
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final CreatePostRequestModel model = CreatePostRequestModel();

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<PostsCubit>(context);
    return Center(
      child: Dialog(
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: globalKey,
              autovalidateMode: autovalidateMode,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InputFieldComponent(
                    icon: Icons.title,
                    hintText: "Title",
                    validator: (str) => requiredFieldValidator(str, context),
                    onChanged: (str) => model.title = str,
                  ),
                  const SizedBox(height: 10),
                  InputFieldComponent(
                    maxLines: 4,
                    fontSize: 14,
                    icon: Icons.text_fields,
                    hintText: "Description",
                    validator: (str) => requiredFieldValidator(str, context),
                    onChanged: (str) => model.content = str,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text('Submit'),
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        bloc.createPost(model);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
