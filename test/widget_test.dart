import 'package:flutter_test/flutter_test.dart';

import 'package:taskmaster/main.dart';

void main() {
  testWidgets('TaskMaster boots and renders splash CTA', (WidgetTester tester) async {
    await tester.pumpWidget(const TaskMaster());

    expect(find.text('Bem-vindo ao TaskMaster'), findsOneWidget);
    expect(find.text('Comecar'), findsOneWidget);
  });
}
