import 'package:dog_license_application/models/response/post_response_model.dart';

class PostsResponse {}

class CreatePostSuccessResponse extends PostsResponse {}

class CreatePostFailureResponse extends PostsResponse {
  final String message;

  CreatePostFailureResponse({required this.message});
}

class GetPostsSuccessResponse extends PostsResponse {
  final List<Post> posts;

  GetPostsSuccessResponse({required this.posts});
}

class GetPostsFailureResponse extends PostsResponse {
  final String message;

  GetPostsFailureResponse({required this.message});
}

class GetPostRepliesSuccessResponse extends PostsResponse {
  final List<Reply> replies;

  GetPostRepliesSuccessResponse({required this.replies});
}

class GetPostRepliesFailureResponse extends PostsResponse {
  final String message;

  GetPostRepliesFailureResponse({required this.message});
}

class CreateReplySuccessResponse extends PostsResponse {}

class CreateReplyFailureResponse extends PostsResponse {
  final String message;

  CreateReplyFailureResponse({required this.message});
}

class DeletePostSuccessResponse extends PostsResponse {}

class DeletePostFailureResponse extends PostsResponse {
  final String message;

  DeletePostFailureResponse({required this.message});
}
