part of 'posts_bloc.dart';

@immutable
abstract class PostsEvent {}

// Initially fetch all posts
class FetchPosts extends PostsEvent {}
