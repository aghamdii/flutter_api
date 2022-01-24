import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_api/features/posts/bloc/posts_bloc.dart';
import 'package:flutter_api/features/posts/data/models/post.dart';
import 'package:flutter_api/features/posts/data/repository/posts_repository.dart';
import 'package:flutter_api/features/posts/presentation/widgets/post_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  PostsPage({Key? key}) : super(key: key);

  static const String routeName = "posts_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr("postsHome")),
      ),
      body: BlocProvider(
        create: (context) => PostsBloc(
          PostsRepository(),
        )..add(
            FetchPosts(),
          ),
        child: BlocBuilder<PostsBloc, PostsState>(
          builder: (context, state) {
            if (state is PostsLoaded) {
              // List of posts when loaded
              List<Post> posts = state.posts;

              return Center(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return PostCard(post: posts[index]);
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                    itemCount: posts.length),
              );
            } else if (state is PostsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              // String error message
              String errorMessage = (state as PostsError).errorMessage;
              return Center(
                child: Text(errorMessage),
              );
            }
          },
        ),
      ),
    );
  }
}
