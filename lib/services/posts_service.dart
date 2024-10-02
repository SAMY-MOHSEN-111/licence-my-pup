import 'package:dio/dio.dart';
import 'package:dog_license_application/configuration/dio_client.dart';
import 'package:dog_license_application/models/request/create_post_request_model.dart';
import 'package:get/get.dart' as getx;

class PostsService {
  static const String _postsEndpoint = "/posts";
  static const String _getRepliesByPostIdEndpoint = "/posts/{postId}/replies";
  final _dio = getx.Get.find<DioClient>().dio;

  Future<Response> createPost(CreatePostRequestModel model) async {
    final formData = FormData.fromMap(model.toJson());
    var response = _dio.post(
      _postsEndpoint,
      data: formData,
      options: Options(contentType: "multipart/form-data"),
    );
    return response;
  }

  Future<Response> getPosts() async {
    return _dio.get(_postsEndpoint);
  }

  Future<Response> getPostRepliesById(String postId) async {
    return _dio.get(_getRepliesByPostIdEndpoint.replaceFirst("{postId}", postId));
  }

  Future<Response> createReply(String postId, String reply) async {
    final formData = FormData.fromMap({"reply": reply});
    var response = await _dio.post(
      _getRepliesByPostIdEndpoint.replaceFirst("{postId}", postId),
      data: formData,
      options: Options(contentType: "multipart/form-data"),
    );
    return response;
  }

  Future<Response> deletePost(String postId) async {
    return _dio.delete("$_postsEndpoint/$postId");
  }
}
