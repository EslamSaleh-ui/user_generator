import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:serverpod/controller/controller.dart';
import 'package:serverpod/components/user_img.dart';
import 'package:serverpod/view/view.dart';
import 'package:serverpod/components/text.dart';

void main() async{
  final user1=controller();
  await user1.generate_user();
  Widget makeTestableWidget() => MaterialApp(home: view(user:user1.generated_user ));
  testWidgets('OK view page', (WidgetTester tester) async{
    TestWidgetsFlutterBinding.ensureInitialized();
    await mockNetworkImagesFor(() => tester.pumpWidget(makeTestableWidget()));
    expect(find.byType(text), findsWidgets);
    expect(find.byType(user_img), findsOneWidget);
  });
}