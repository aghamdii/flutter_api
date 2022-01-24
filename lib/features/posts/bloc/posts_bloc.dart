// ignore_for_file: avoid_print
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_api/features/posts/data/models/post.dart';
import 'package:flutter_api/features/posts/data/repository/posts_repository.dart';
import 'package:meta/meta.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  // Repository dependency
  final PostsRepository _postsRepository;

  PostsBloc(this._postsRepository) : super(PostsLoading()) {
    // BLoC Events
    on<FetchPosts>(_onFetchPosts);
  }

  @override
  void onChange(Change<PostsState> change) {
    // Trigger on any change on the BLoC
    super.onChange(change);
    print(change);
  }

  void _onFetchPosts(FetchPosts event, Emitter<PostsState> emit) async {
    try {
      // Show loading
      emit(PostsLoading());
      // Get the posts from the repository
      final posts = await _postsRepository.getPosts();
      emit(PostsLoaded(posts: posts));
    } catch (e) {
      // If error emit Error state
      emit(PostsError(errorMessage: e.toString()));
    }
  }
}
