import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api/core/shared/widgets/heading_text.dart';
import 'package:flutter_api/features/posts/data/models/post.dart';
import 'package:flutter_api/features/posts/presentation/widgets/post_title.dart';

class PostDetailsPage extends StatelessWidget {
  static const String routeName = "post_details";

  final Post post;
  PostDetailsPage({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr("postDetails")),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(48),
                  child: Image.network(post.imageUrl, fit: BoxFit.cover),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              HeadingText(post.title),
              const SizedBox(
                height: 30,
              ),
              Text(post.description),
            ],
          ),
        ),
      ),
    );
  }
}
