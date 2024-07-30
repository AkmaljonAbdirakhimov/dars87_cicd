import 'package:dars87_cicd/examples/dio_http.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("Hello", (testers) async {});

  test("Mello", () async {
    final users = Users();

    // List<String> result = await users.getUsers();

    // expect(result, ["Ali", "Vali"]);

    Response response = await users.getPost();

    expect(response.statusCode, 200);
  });
}
