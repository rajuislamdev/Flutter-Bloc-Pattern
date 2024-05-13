import 'dart:convert';

import 'package:bloc_practice/config/app_constants.dart';
import 'package:bloc_practice/models/post_model.dart';
import 'package:bloc_practice/utils/api_client.dart';
import 'package:http/http.dart';

class PostRepository {
  static Future<List<Post>> fetchPosts() async {
    Response response = await ApiClient.get(apiUrl: AppConstants.posts);
    List<dynamic> data = await jsonDecode(response.body);
    List<Post> postsList = data.map((post) => Post.fromMap(post)).toList();
    return postsList;
  }
}
