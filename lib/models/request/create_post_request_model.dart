class CreatePostRequestModel {
  String title;
  String content;

  CreatePostRequestModel({
    this.title = '',
    this.content = '',
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['post'] = content;
    return data;
  }
}