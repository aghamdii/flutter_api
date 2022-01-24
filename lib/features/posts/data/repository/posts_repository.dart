// Class that will handle data to the BLoC
import 'package:flutter_api/features/posts/data/data_source/posts_api.dart';
import 'package:flutter_api/features/posts/data/models/post.dart';

class PostsRepository {
  final PostsApi _postsApi = PostsApi();

  Future<List<Post>> getPosts() async {
    try {
      // Use the api to get the data back
      var res = await _postsApi.getPosts();

      List<Post> posts = res.map((json) => Post.fromJson(json)).toList();
      print(posts);
      return posts;
    } catch (e) {
      throw Exception("Error in repository");
    }
  }
}
