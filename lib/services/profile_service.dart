import 'package:dio/dio.dart';
import 'package:dog_license_application/configuration/dio_client.dart';
import 'package:dog_license_application/models/request/change_password_request_model.dart';
import 'package:dog_license_application/models/request/update_profile_request_model.dart';
import 'package:get/get.dart' as getx;

class ProfileService {
  static const String _profileEndpoint = "/profile";
  static const String _uploadProfileAvatarEndpoint = "/profile/avatar";
  static const String _changePasswordEndpoint = "/profile/reset-password";

  final _dio = getx.Get.find<DioClient>().dio;

  Future<Response> uploadProfileAvatar(String imagePath) async {
    final formData = FormData.fromMap({
      "image": await MultipartFile.fromFile(
        imagePath,
        filename: "avatar.jpg",
      ),
    });
    return _dio.post(
      _uploadProfileAvatarEndpoint,
      data: formData,
      options: Options(contentType: "multipart/form-data"),
    );
  }

  Future<Response> getProfile() async {
    return _dio.get(_profileEndpoint);
  }

  Future<Response> updateProfile(UpdateProfileRequestModel model) async {
    return _dio.patch(_profileEndpoint, data: model.toJson());
  }

  Future<Response> changePassword(ChangePasswordRequestModel model) async {
    return _dio.post(_changePasswordEndpoint, data: model.toJson());
  }
}
