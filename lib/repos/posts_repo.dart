import 'package:dio/dio.dart';
import 'package:dog_license_application/models/request/create_post_request_model.dart';
import 'package:dog_license_application/models/response/post_response_model.dart';
import 'package:dog_license_application/response/posts_response.dart';
import 'package:dog_license_application/services/posts_service.dart';

class PostsRepo {
  Future<PostsResponse> createPost(CreatePostRequestModel model) async {
    try{
      await PostsService().createPost(model);
      return CreatePostSuccessResponse();
    } on DioException catch(error){
      return CreatePostFailureResponse(message: error.response?.data['message']);
    }
  }

  Future<PostsResponse> getPosts() async {
    try{
      final response = await PostsService().getPosts();
      return GetPostsSuccessResponse(posts: (response.data as List).map((e) => Post.fromJson(e)).toList());
    } on DioException catch(error){
      return GetPostsFailureResponse(message: error.response?.data['message']);
    }
  }

  Future<PostsResponse> getPostRepliesById(String id) async {
    try{
      final response = await PostsService().getPostRepliesById(id);
      return GetPostRepliesSuccessResponse(replies: (response.data as List).map((e) => Reply.fromJson(e)).toList());
    } on DioException catch(error){
      return GetPostRepliesFailureResponse(message: error.response?.data['message']);
    }
  }

  Future<PostsResponse> createReply(String postId, String reply) async {
    try{
      await PostsService().createReply(postId, reply);
      return CreateReplySuccessResponse();
    } on DioException catch(error){
      return CreateReplyFailureResponse(message: error.response?.data['message']);
    }
  }

  Future<PostsResponse> deletePost(String postId) async {
    try{
      await PostsService().deletePost(postId);
      return DeletePostSuccessResponse();
    } on DioException catch(error){
      return DeletePostFailureResponse(message: error.response?.data['message']);
    }
  }
}