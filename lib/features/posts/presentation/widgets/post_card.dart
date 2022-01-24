import 'package:flutter/material.dart';
import 'package:flutter_api/features/posts/data/models/post.dart';
import 'package:flutter_api/features/posts/presentation/view/post_details_page.dart';
import 'package:flutter_api/features/posts/presentation/widgets/post_title.dart';

class PostCard extends StatelessWidget {
  final Post post;
  PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, PostDetailsPage.routeName,
            arguments: post);
      },
      child: Card(
        elevation: 2,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Image.network(
                post.imageUrl,
                height: 100,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PostTitle(post.title),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    post.description,
                    overflow: TextOverflow.fade,
                    maxLines: 1,
                    softWrap: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
