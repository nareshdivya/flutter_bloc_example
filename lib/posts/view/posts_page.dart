import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_research/posts/view/posts_list.dart';
import 'package:flutter_research/posts/widgets/post_list_item.dart';
import '../posts.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (_)=> PostBloc(postRepository: PostRepository())..add(PostFetched()),
        child: const PostLists(),
      ),
    );
  }
}
