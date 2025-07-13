import 'package:dio/dio.dart';

class NetworkingService {
  final Dio dio = Dio();

  Future getPosts(String id) async {
    final response = await dio.get(
      'https://jsonplaceholder.typicode.com/posts',
    );
  }
}
