import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:serverpod/main.dart';

void main() {
  testWidgets('OK', (widgetTester) async{
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(FloatingActionButton), findsOneWidget);
       await widgetTester.tap(find.byType(FloatingActionButton));
       await widgetTester.pump();
       expect(find.byWidget(MyHomePage()), findsOneWidget);
  });
}