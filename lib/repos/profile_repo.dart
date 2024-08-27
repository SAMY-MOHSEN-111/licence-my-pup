import 'package:dio/dio.dart';
import 'package:dog_license_application/models/request/change_password_request_model.dart';
import 'package:dog_license_application/models/request/update_profile_request_model.dart';
import 'package:dog_license_application/models/response/get_profile_response_model.dart';
import 'package:dog_license_application/models/response/upload_avatar_response_model.dart';
import 'package:dog_license_application/response/profile_response.dart';
import 'package:dog_license_application/services/profile_service.dart';

class ProfileRepo {
  Future<ProfileResponse> uploadProfileAvatar(String imagePath) async {
    try {
      final response = await ProfileService().uploadProfileAvatar(imagePath);
      return UploadAvatarSuccessResponse(
        uploadAvatarResponseModel: UploadAvatarResponseModel.fromJson(response.data),
      );
    } on DioException catch (error) {
      return UploadAvatarFailureResponse(message: error.response?.data['message']);
    }
  }

  Future<ProfileResponse> getProfile() async {
    try {
      final response = await ProfileService().getProfile();
      return GetProfileSuccessResponse(
        getProfileResponseModel: GetProfileResponseModel.fromJson(response.data),
      );
    } on DioException catch (error) {
      return GetProfileFailureResponse(message: error.response?.data['message']);
    }
  }

  Future<ProfileResponse> updateProfile(UpdateProfileRequestModel model) async {
    try {
      await ProfileService().updateProfile(model);
      return UpdateProfileSuccessResponse();
    } on DioException catch (error) {
      return UpdateProfileFailureResponse(message: error.response?.data['message']);
    }
  }

  Future<ProfileResponse> changePassword(ChangePasswordRequestModel model) async {
    try {
      await ProfileService().changePassword(model);
      return ChangePasswordSuccessResponse();
    } on DioException catch (error) {
      return ChangePasswordFailureResponse(message: error.response?.data['message']);
    }
  }
}
