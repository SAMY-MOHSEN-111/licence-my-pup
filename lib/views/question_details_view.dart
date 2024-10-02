import 'package:dog_license_application/constants/theme_constants.dart';
import 'package:dog_license_application/cubits/posts_cubit/posts_cubit.dart';
import 'package:dog_license_application/models/response/post_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class QuestionDetailsView extends StatefulWidget {
  static const String id = "/QuestionDetailsView";

  const QuestionDetailsView({super.key});

  @override
  State<QuestionDetailsView> createState() => _QuestionDetailsViewState();
}

class _QuestionDetailsViewState extends State<QuestionDetailsView> {
  var replyController = TextEditingController();
  final post = Get.arguments as Post;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostsCubit>(context).getPostsRepliesById(post.id.toString());
  }

  final GetStorage _storage = GetStorage(); // Initialize GetStorage

  String formatDateTime(String dateTime) {
    final date = DateTime.parse(dateTime);
    return DateFormat('yyyy-MM-dd HH:mm').format(date);
  }

  Future<void> _refreshReplies(Post post) async {
    BlocProvider.of<PostsCubit>(context).getPostsRepliesById(post.id.toString());
  }

  void deleteQuestion() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Question'),
        content: const Text('Are you sure you want to delete this question?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<PostsCubit>(context).deletePost(post.id.toString());
              Navigator.of(context).pop();
              Get.back();
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  void editQuestion(Post post) {
    Get.toNamed('/EditQuestionView', arguments: post);
  }

  @override
  Widget build(BuildContext context) {
    final post = Get.arguments as Post;
    final loggedInUserEmail = _storage.read('email'); // Read the logged-in user's email

    return Scaffold(
      appBar: AppBar(
        title: Text(
          post.title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          // if (loggedInUserEmail == post.author.email) // Compare the emails
          //   IconButton(
          //     icon: const Icon(Icons.edit, color: Colors.white),
          //     onPressed: () => editQuestion(post),
          //   ),
          if (loggedInUserEmail == post.author.email) // Conditionally show delete icon
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: deleteQuestion,
            ),
        ],
      ),
      body: Stack(
        children: [
          RefreshIndicator(
            onRefresh: () => _refreshReplies(post), // Refresh handler
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              padding: const EdgeInsets.only(bottom: 80),
              // Extra padding to avoid overlap with the input field
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Author details
                    Text(
                      "Author: ${post.author.fullName}",
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 8),
                    // Post title
                    Text(
                      post.title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    // Description label
                    const Text(
                      "Description",
                      style: TextStyle(color: kPrimaryColor, fontSize: 16),
                    ),
                    // Post text
                    Text(
                      post.text,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 16),
                    // Post creation time
                    Text(
                      "Posted on: ${formatDateTime(post.createdAt)}",
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 24),
                    // Replies section
                    const Text(
                      "Replies",
                      style: TextStyle(color: kPrimaryColor, fontSize: 16),
                    ),
                    BlocBuilder<PostsCubit, PostsState>(
                      builder: (context, state) {
                        var bloc = BlocProvider.of<PostsCubit>(context);
                        if (state is PostsLoading) {
                          return const Center(child: CircularProgressIndicator());
                        } else if (state is PostsSuccess && bloc.replies.isNotEmpty) {
                          return Column(
                            children: List.generate(bloc.replies.length, (index) {
                              final reply = bloc.replies[index];
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Reply by: ${reply.author.email}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    reply.text,
                                    style: const TextStyle(fontSize: 14),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Created at: ${formatDateTime(reply.createdAt)}',
                                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                                  ),
                                  const Divider(height: 20),
                                ],
                              );
                            }),
                          );
                        } else if (state is PostsSuccess && bloc.replies.isEmpty) {
                          return const Center(child: Text("No replies yet."));
                        } else {
                          return const Center(child: Text("Error loading replies."));
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              color: kScaffoldBackgroundColor, // Optional: add background color to input section
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: replyController,
                      decoration: InputDecoration(
                        hintText: 'Write your reply...',
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.grey),
                        ),
                      ),
                      maxLines: 1,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send, color: kPrimaryColor),
                    onPressed: () {
                      if (replyController.text.isNotEmpty) {
                        BlocProvider.of<PostsCubit>(context).createReply(
                          post.id.toString(),
                          replyController.text,
                        );
                        replyController.clear();
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
