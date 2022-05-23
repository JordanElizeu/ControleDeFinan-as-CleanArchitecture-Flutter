import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:controle_financeiro/app/shared/presentation/components/components.dart';
import 'package:controle_financeiro/i18n/constants_i18n.dart';

main() {
  testWidgets('all widgets should exists', (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: AlertDialogWidget(
        messageError: 'error 404',
      ),
    ));

    final alertDialog = find.byType(AlertDialog);
    final singleChildScrollView = find.byType(SingleChildScrollView);
    final text = find.byType(Text);
    final container = find.byType(Container);
    final padding = find.byType(Padding);
    final expanded = find.byType(Expanded);
    final icon = find.byType(Icon);
    final sizedBox = find.byType(SizedBox);
    final elevatedButton = find.byType(ElevatedButton);

    expect(alertDialog, findsOneWidget);
    expect(singleChildScrollView, findsOneWidget);
    expect(text, findsNWidgets(3));
    expect(container, findsOneWidget);
    expect(padding, findsNWidgets(6));
    expect(expanded, findsNWidgets(2));
    expect(icon, findsOneWidget);
    expect(sizedBox, findsNWidgets(3));
    expect(elevatedButton, findsOneWidget);
  });

  testWidgets('should return size of widgets',
      (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: AlertDialogWidget(
        messageError: 'error 404',
      ),
    ));

    final icon = find.byType(Icon);

    final heightIcon = widgetTester.getSize(icon).height;

    expect(heightIcon, equals(50));
  });

  testWidgets('should return icon widget', (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: AlertDialogWidget(
        messageError: 'error 404',
      ),
    ));

    expect(find.widgetWithIcon(Expanded, Icons.error), findsOneWidget);
  });

  testWidgets('should return size of widgets',
      (WidgetTester widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(
      home: Scaffold(
        body: Center(
          child: AlertDialogWidget(
            messageError: 'error 404',
          ),
        ),
      ),
    ));

    final icon = find.byType(Icon);

    final heightIcon = widgetTester.getSize(icon).height;

    expect(heightIcon, equals(50));
  });

  testWidgets('should return widget text', (WidgetTester widgetTester) async {
    const messageError = 'error 404';
    await widgetTester.pumpWidget(const MaterialApp(
      home: AlertDialogWidget(
        messageError: messageError,
      ),
    ));

    expect(find.widgetWithText(Expanded, messageError), findsOneWidget);
    expect(
      find.widgetWithText(ElevatedButton, ConstantI18n.buttonConfirmDialogText),
      findsOneWidget,
    );
  });
}
