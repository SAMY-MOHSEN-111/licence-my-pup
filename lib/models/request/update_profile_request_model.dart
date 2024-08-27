class UpdateProfileRequestModel {
  String fullName;
  String email;
  String dateOfBirth;
  String gender;

  UpdateProfileRequestModel({
    this.fullName = '',
    this.email = '',
    this.dateOfBirth = '',
    this.gender = '',
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fullName'] = fullName;
    data['email'] = email;
    data['birthDate'] = dateOfBirth;
    data['gender'] = gender;
    return data;
  }
}
