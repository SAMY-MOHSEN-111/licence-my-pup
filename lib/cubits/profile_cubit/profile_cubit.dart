import 'package:bloc/bloc.dart';
import 'package:dog_license_application/helpers/snack_bar_helper.dart';
import 'package:dog_license_application/models/request/change_password_request_model.dart';
import 'package:dog_license_application/models/request/update_profile_request_model.dart';
import 'package:dog_license_application/repos/profile_repo.dart';
import 'package:dog_license_application/response/profile_response.dart';
import 'package:dog_license_application/views/home_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  var isLoading = false;

  void uploadProfileAvatar() async {
    isLoading = true;
    emit(ProfileLoading());
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      var response = await ProfileRepo().uploadProfileAvatar(image.path);
      if (response is UploadAvatarSuccessResponse) {
        isLoading = false;
        GetStorage().write("avatar", response.uploadAvatarResponseModel.avatarUrl);
        emit(ProfileSuccess());
      } else if (response is UploadAvatarFailureResponse) {
        isLoading = false;
        showSnackBar(response.message);
        emit(ProfileFailure(message: response.message));
      }
    }
    isLoading = false;
    emit(ProfileInitial());
  }

  void getProfile() async {
    isLoading = true;
    emit(ProfileLoading());
    var response = await ProfileRepo().getProfile();
    if (response is GetProfileSuccessResponse) {
      isLoading = false;
      await GetStorage().write("profile", response.getProfileResponseModel.toJson());
      await GetStorage().write("avatar", response.getProfileResponseModel.avatarUrl);
      emit(ProfileSuccess());
    } else if (response is GetProfileFailureResponse) {
      isLoading = false;
      showSnackBar(response.message);
      emit(ProfileFailure(message: response.message));
    }
  }

  void updateProfile(UpdateProfileRequestModel model) async {
    isLoading = true;
    emit(ProfileLoading());
    var response = await ProfileRepo().updateProfile(model);
    if (response is UpdateProfileSuccessResponse) {
      isLoading = false;
      showSnackBar("Profile updated successfully");
      emit(ProfileSuccess());
    } else if (response is UpdateProfileFailureResponse) {
      isLoading = false;
      showSnackBar(response.message);
      emit(ProfileFailure(message: response.message));
    }
  }

  void changePassword(ChangePasswordRequestModel model) async {
    if (model.newPassword != model.confirmPassword) {
      showSnackBar("Passwords do not match");
      return;
    }

    isLoading = true;
    emit(ProfileLoading());
    var response = await ProfileRepo().changePassword(model);
    if (response is ChangePasswordSuccessResponse) {
      isLoading = false;
      Get.offAllNamed(HomeView.id);
      showSnackBar("Password changed successfully");
      emit(ProfileSuccess());
    } else if (response is ChangePasswordFailureResponse) {
      isLoading = false;
      showSnackBar(response.message);
      emit(ProfileFailure(message: response.message));
    }
  }
}
