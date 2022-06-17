import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:search_and_filtering/view/home_page.dart';
import 'package:search_and_filtering/config/app_config.dart' as conf;

void main() {
  testWidgets("Filter Screen Open Test", (WidgetTester tester) async {
    //related widgets
    final filterIcon = find.byKey(const Key("filter"));

    await tester.pumpWidget(
      const MaterialApp(
        home: HomePage(title: conf.appName),
      ),
    );
    await tester.tap(filterIcon);
    await tester.pump();

    expect(find.text('Filter'), findsWidgets);
  });
}
