class GetProfileResponseModel {
  late int id;
  late String email;
  late String password;
  late String fullName;
  late String avatarUrl;
  late String dateOfBirth;
  late String gender;
  late String internalAvatarUrl;

  GetProfileResponseModel({
    required this.id,
    required this.email,
    required this.password,
    required this.fullName,
    required this.avatarUrl,
    required this.dateOfBirth,
    required this.gender,
    required this.internalAvatarUrl,
  });

  GetProfileResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    fullName = json['fullName'];
    avatarUrl = json['avatar'] ?? '';
    dateOfBirth = json['birthDate'];
    gender = json['gender'];
    internalAvatarUrl = json['internalAvatarUrl'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['password'] = password;
    data['fullName'] = fullName;
    data['avatarUrl'] = avatarUrl;
    data['dateOfBirth'] = dateOfBirth;
    data['gender'] = gender;
    data['internalAvatarUrl'] = internalAvatarUrl;
    return data;
  }
}
