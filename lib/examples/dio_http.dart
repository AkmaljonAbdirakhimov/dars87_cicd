import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() async {
  final users = Users();
  Response response = await users.getPost();

  print(response.statusCode);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

class Users {
  Future<List<String>> getUsers() async {
    await Future.delayed(const Duration(seconds: 2));

    return ["Ali", "Vali"];
  }

  Future<Response> getPost() async {
    final dio = Dio();
    final dioAdapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = dioAdapter;

    const path = "https://jsonplaceholder.typicode.com/posts/1";

    dioAdapter.onGet(path, (request) {
      return request.reply(200, "success");
    });

    Response response = await dio.get(path);
    return response;
  }
}
