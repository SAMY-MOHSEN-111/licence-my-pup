class PostsResponse {}

class CreatePostSuccessResponse extends PostsResponse {}

class CreatePostFailureResponse extends PostsResponse {
  final String message;

  CreatePostFailureResponse({required this.message});
}
