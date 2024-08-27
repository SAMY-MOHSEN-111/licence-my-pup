class ChangePasswordRequestModel {
  String newPassword;
  String currentPassword;
  String confirmPassword;

  ChangePasswordRequestModel({
    this.newPassword = '',
    this.currentPassword = '',
    this.confirmPassword = '',
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['newPassword'] = newPassword;
    data['currentPassword'] = currentPassword;
    return data;
  }
}