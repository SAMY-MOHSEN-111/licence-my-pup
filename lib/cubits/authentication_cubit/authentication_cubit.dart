import 'package:bloc/bloc.dart';
import 'package:dog_license_application/helpers/snack_bar_helper.dart';
import 'package:dog_license_application/models/request/login_request_model.dart';
import 'package:dog_license_application/models/request/register_request_model.dart';
import 'package:dog_license_application/repos/authentication_repo.dart';
import 'package:dog_license_application/response/authentication_response.dart';
import 'package:dog_license_application/views/home_view.dart';
import 'package:dog_license_application/views/login_view.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:meta/meta.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  AuthenticationCubit() : super(AuthenticationInitial());

  bool isLoading = false;

  void login(LoginRequestModel model) async {
    isLoading = true;
    emit(AuthenticationLoading());
    var response = await AuthenticationRepo().login(model);
    if (response is LoginSuccessResponse) {
      isLoading = false;
      await GetStorage().write("token", response.loginResponseModel.token);
      await GetStorage().write("logged-in", true);
      Get.offAllNamed(HomeView.id);
      emit(AuthenticationSuccess());
    } else if (response is LoginFailedResponse) {
      isLoading = false;
      showSnackBar(response.message);
      emit(AuthenticationFailure(message: response.message));
    }
  }

  void register(RegisterRequestModel model) async {
    if (model.password != model.confirmPassword) {
      showSnackBar("Passwords do not match");
      return;
    }

    isLoading = true;
    emit(AuthenticationLoading());
    var response = await AuthenticationRepo().register(model);
    if (response is RegisterSuccessResponse) {
      isLoading = false;
      await GetStorage().write("token", response.registerResponseModel.token);
      await GetStorage().write("logged-in", true);
      Get.offAllNamed(HomeView.id);
      emit(AuthenticationSuccess());
    } else if (response is RegisterFailedResponse) {
      isLoading = false;
      showSnackBar(response.message);
      emit(AuthenticationFailure(message: response.message));
    }
  }

  void logout() {
    GetStorage().remove("token");
    GetStorage().remove("avatar");
    GetStorage().remove("profile");
    GetStorage().write("logged-in", false);
    Get.offAllNamed(LoginView.id);
  }
}
