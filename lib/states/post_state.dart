import '../models/post_model.dart';

abstract class PostsState {}

class PostsInitial extends PostsState {}

class PostsLoading extends PostsState {}

class PostsLoaded extends PostsState {
  final List<Post> posts;

  PostsLoaded({required this.posts});
}

class PostsError extends PostsState {
  final String errorMessage;

  PostsError({required this.errorMessage});
}
