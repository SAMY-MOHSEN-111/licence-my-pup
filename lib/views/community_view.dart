import 'dart:developer';

import 'package:dog_license_application/cubits/posts_cubit/posts_cubit.dart';
import 'package:dog_license_application/generated/l10n.dart';
import 'package:dog_license_application/views/question_details_view.dart';
import 'package:dog_license_application/widgets/create_post_dialog.dart';
import 'package:dog_license_application/widgets/drawer_component.dart';
import 'package:dog_license_application/widgets/question_component.dart';
import 'package:dog_license_application/widgets/reusable_fab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommunityView extends StatefulWidget {
  static const String id = "/CommunityView";

  const CommunityView({super.key});

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostsCubit>(context).getPosts();
  }

  Future<void> _refreshPosts() async {
    BlocProvider.of<PostsCubit>(context).getPosts();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = BlocProvider.of<PostsCubit>(context);
    log("${bloc.posts.length}");
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text(S.of(context).community_view__title),
          ),
          drawer: const DrawerComponent(),
          body: RefreshIndicator(
            onRefresh: _refreshPosts, // Set the refresh function
            child: BlocBuilder<PostsCubit, PostsState>(
              builder: (context, state) {
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  itemCount: bloc.posts.length,
                  itemBuilder: (context, index) {
                    var post = bloc.posts[index];
                    return bloc.isLoading
                        ? const Skeletonizer(
                            child: ListTile(
                              title: Text("this is a small title"),
                              subtitle: Text("good question, good question, good question, "),
                            ),
                          )
                        : QuestionComponent(
                            post: post,
                            onTap: () => Get.toNamed(QuestionDetailsView.id, arguments: post),
                          );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 5);
                  },
                );
              },
            ),
          ),
          floatingActionButton: ReusableFAB(
            icon: const Icon(Icons.add),
            onPressed: () => Get.dialog(const CreatePostDialog()),
          ),
        ),
      ],
    );
  }
}
