import 'package:dio/dio.dart';
import 'package:dog_license_application/configuration/dio_client.dart';
import 'package:get/get.dart' as getx;

class PostsService {
  static const String _postsEndpoint = "/posts";
  final _dio = getx.Get.find<DioClient>().dio;

  Future<Response> createPost(String question) {
    var response = _dio.post(_postsEndpoint, data: {"question": question});
    return response;
  }
}
