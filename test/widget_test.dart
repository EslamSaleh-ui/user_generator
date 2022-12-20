import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:serverpod/components/container.dart';
import 'package:serverpod/main.dart';

void main() async{
  testWidgets('OK main page', (WidgetTester tester) async{
    await tester.pumpWidget(MaterialApp(home: MyHomePage() ));
expect(find.text('Generate User'), findsOneWidget);
expect(find.text('Welcome'), findsOneWidget);
expect(find.byType(Stack),findsWidgets);
expect(find.widgetWithText(ElevatedButton,'Generate User'),findsWidgets);
expect(find.byType( container),findsWidgets);
await tester.press(find.widgetWithText(ElevatedButton,'Generate User'));
await tester.pumpAndSettle();
    expect(find.byWidget(MaterialApp(home: MyHomePage() )),findsNothing);
  });
}