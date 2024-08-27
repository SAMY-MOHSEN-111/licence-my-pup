import 'package:dog_license_application/models/response/get_profile_response_model.dart';
import 'package:dog_license_application/models/response/upload_avatar_response_model.dart';

class ProfileResponse {}

class UploadAvatarSuccessResponse extends ProfileResponse {
  final UploadAvatarResponseModel uploadAvatarResponseModel;

  UploadAvatarSuccessResponse({required this.uploadAvatarResponseModel});
}

class UploadAvatarFailureResponse extends ProfileResponse {
  final String message;

  UploadAvatarFailureResponse({required this.message});
}

class GetProfileSuccessResponse extends ProfileResponse {
  final GetProfileResponseModel getProfileResponseModel;

  GetProfileSuccessResponse({required this.getProfileResponseModel});
}

class GetProfileFailureResponse extends ProfileResponse {
  final String message;

  GetProfileFailureResponse({required this.message});
}

class UpdateProfileSuccessResponse extends ProfileResponse {}

class UpdateProfileFailureResponse extends ProfileResponse {
  final String message;

  UpdateProfileFailureResponse({required this.message});
}

class ChangePasswordSuccessResponse extends ProfileResponse {}

class ChangePasswordFailureResponse extends ProfileResponse {
  final String message;

  ChangePasswordFailureResponse({required this.message});
}
