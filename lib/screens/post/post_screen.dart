import 'package:bloc_practice/blocs/post_bloc.dart';
import 'package:bloc_practice/events/post_event.dart';
import 'package:bloc_practice/models/post_model.dart';
import 'package:bloc_practice/states/post_state.dart';
import 'package:bloc_practice/widgets/error.dart';
import 'package:bloc_practice/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  PostsBloc postsBloc = PostsBloc();
  @override
  void initState() {
    postsBloc.add(PostsInitialFetchPosts());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Screen'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocConsumer<PostsBloc, PostsState>(
      bloc: postsBloc,
      builder: ((context, state) {
        switch (state.runtimeType) {
          case const (PostsLoading):
            return const CustomLoadingWidget();
          case (const (PostsError)):
            return CustomErrorWidget(
                errorMessage: (state as PostsError).errorMessage);
          case const (PostsLoaded):
            return _buildListView(posts: (state as PostsLoaded).posts);
          default:
            return const SizedBox();
        }
      }),
      listener: (context, state) => {},
    );
  }

  Widget _buildListView({required List<Post> posts}) {
    return ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return ListTile(
            title: Text(post.title),
            subtitle: Text(post.body),
            onTap: () {},
          );
        });
  }
}
