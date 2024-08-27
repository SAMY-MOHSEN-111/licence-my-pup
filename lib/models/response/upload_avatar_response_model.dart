class UploadAvatarResponseModel {
  late String avatarUrl;

  UploadAvatarResponseModel({
    required this.avatarUrl,
  });

  UploadAvatarResponseModel.fromJson(Map<String, dynamic> json) {
    avatarUrl = json['avatarUrl'];
  }
}