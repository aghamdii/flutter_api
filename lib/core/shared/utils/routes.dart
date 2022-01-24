import 'package:flutter/material.dart';
import 'package:flutter_api/features/posts/data/models/post.dart';
import 'package:flutter_api/features/posts/presentation/view/post_details_page.dart';
import 'package:flutter_api/features/posts/presentation/view/posts_page.dart';

class Routes {
  // Function to handle routing in the app
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case PostsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => PostsPage(),
        );

      case PostDetailsPage.routeName:
        return MaterialPageRoute(
          builder: (context) => PostDetailsPage(
            post: (settings.arguments as Post),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => PostsPage(),
        );
    }
  }
}
