class RegisterRequestModel {
  String fullName;
  String gender;
  String dateOfBirth;
  String email;
  String password;
  String confirmPassword;

  RegisterRequestModel({
    this.fullName = '',
    this.gender = '',
    this.dateOfBirth = '',
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['gender'] = gender;
    data['birthDate'] = dateOfBirth;
    data['email'] = email;
    data['password'] = password;
    return data;
  }
}
