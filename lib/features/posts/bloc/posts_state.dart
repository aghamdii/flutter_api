part of 'posts_bloc.dart';

@immutable
abstract class PostsState {}

class PostsLoaded extends PostsState {
  // When posts are being loaded
  final List<Post> posts;
  PostsLoaded({required this.posts});

  @override
  String toString() => "PostsLoaded";
}

class PostsLoading extends PostsState {
  // When fetching the posts
  @override
  String toString() => "PostsLoading";
}

class PostsError extends PostsState {
  // When any error occur
  final String errorMessage;
  PostsError({required this.errorMessage});
  @override
  String toString() => "PostsErrorOccured";
}
