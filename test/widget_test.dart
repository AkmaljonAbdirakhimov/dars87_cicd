import 'package:dars87_cicd/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("CI/CD Test", (tester) async {
    await tester.pumpWidget(const MyApp());
    expect(find.text("Salom, CI/CD!"), findsOneWidget);
  });
}
