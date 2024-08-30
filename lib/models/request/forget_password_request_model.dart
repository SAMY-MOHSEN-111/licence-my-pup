class ForgetPasswordRequestModel {
  String otp;
  String email;
  String newPassword;
  String confirmPassword;

  ForgetPasswordRequestModel({
    this.otp = '',
    this.email = '',
    this.newPassword = '',
    this.confirmPassword = '',
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['otp'] = otp;
    data['email'] = email;
    data['newPassword'] = newPassword;
    return data;
  }
}