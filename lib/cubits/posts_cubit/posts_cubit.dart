import 'package:bloc/bloc.dart';
import 'package:dog_license_application/helpers/snack_bar_helper.dart';
import 'package:dog_license_application/models/request/create_post_request_model.dart';
import 'package:dog_license_application/models/response/post_response_model.dart';
import 'package:dog_license_application/repos/posts_repo.dart';
import 'package:dog_license_application/response/posts_response.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  PostsCubit() : super(PostsInitial());

  bool isLoading = false;
  List<Post> posts = [];
  List<Reply> replies = [];

  void createPost(CreatePostRequestModel model) async {
    isLoading = true;
    emit(PostsLoading());
    var response = await PostsRepo().createPost(model);
    if (response is CreatePostSuccessResponse) {
      isLoading = false;
      Get.back();
      getPosts();
      emit(PostsSuccess());
    } else if (response is CreatePostFailureResponse) {
      isLoading = false;
      showSnackBar(response.message);
      emit(PostsFailure(message: response.message));
    }
  }



  void getPosts() async {
    isLoading = true;
    emit(PostsLoading());
    var response = await PostsRepo().getPosts();
    if (response is GetPostsSuccessResponse) {
      isLoading = false;
      posts = response.posts.reversed.toList();
      emit(PostsSuccess());
    } else if (response is GetPostsFailureResponse) {
      isLoading = false;
      showSnackBar(response.message);
      emit(PostsFailure(message: response.message));
    }
  }

  void getPostsRepliesById(String postId) async {
    isLoading = true;
    emit(PostsLoading());
    var response = await PostsRepo().getPostRepliesById(postId);
    if (response is GetPostRepliesSuccessResponse) {
      isLoading = false;
      replies = response.replies.reversed.toList();
      emit(PostsSuccess());
    } else if (response is GetPostRepliesFailureResponse) {
      isLoading = false;
      showSnackBar(response.message);
      emit(PostsFailure(message: response.message));
    }
  }

  void createReply(String postId, String reply) async {
    isLoading = true;
    emit(PostsLoading());
    var response = await PostsRepo().createReply(postId, reply);
    if (response is CreateReplySuccessResponse) {
      isLoading = false;
      getPostsRepliesById(postId);
      emit(PostsSuccess());
    } else if (response is CreateReplyFailureResponse) {
      isLoading = false;
      showSnackBar(response.message);
      emit(PostsFailure(message: response.message));
    }
  }

  void deletePost(String postId) async {
    isLoading = true;
    emit(PostsLoading());
    var response = await PostsRepo().deletePost(postId);
    if (response is DeletePostSuccessResponse) {
      isLoading = false;
      getPosts();
      emit(PostsSuccess());
    } else if (response is DeletePostFailureResponse) {
      isLoading = false;
      showSnackBar(response.message);
      emit(PostsFailure(message: response.message));
    }
  }
}
