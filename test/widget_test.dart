import 'package:flutter_test/flutter_test.dart';
import 'package:ta2seema/main.dart';

void main() {
  testWidgets('Home screen loads', (WidgetTester tester) async {
    await tester.pumpWidget(const A7gezlyApp());
    expect(find.textContaining('Ready to play'), findsOneWidget);
  });
}
