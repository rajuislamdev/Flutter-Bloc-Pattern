import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_practice/events/post_event.dart';
import 'package:bloc_practice/models/post_model.dart';
import 'package:bloc_practice/repositories/post_repository.dart';
import 'package:bloc_practice/states/post_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    on<PostsInitialFetchPosts>(postsInitialFetchPosts);
  }

  FutureOr<void> postsInitialFetchPosts(
      PostsInitialFetchPosts event, Emitter<PostsState> emit) async {
    emit(PostsLoading());
    try {
      List<Post> posts = await PostRepository.fetchPosts();
      emit(PostsLoaded(posts: posts));
    } catch (e) {
      emit(PostsError(errorMessage: "Failed to fetch posts:\n $e"));
    }
  }
}
