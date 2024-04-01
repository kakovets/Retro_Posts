import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../models/post_model.dart';
part 'posts_api.g.dart';

@RestApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class PostsApi {

  factory PostsApi(Dio dio) = _PostsApi;

  @GET('/posts')
  Future<List<PostModel>> getPosts();
}