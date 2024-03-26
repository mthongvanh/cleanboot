import 'package:cleanboot/ui/widgets/navigation/elevated_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ElevatedNavigationBar', () {
    late List<NavigationDestination> destinations;
    setUp(() {
      destinations = const [
        NavigationDestination(
          icon: Icon(Icons.dangerous),
          label: 'Label',
        ),
        NavigationDestination(
          icon: Icon(Icons.abc_outlined),
          label: 'Label 2',
        ),
      ];
    });

    testWidgets('Creates an instance of ElevatedNavigationBar',
        (final tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: ElevatedNavigationBar(
            destinations: destinations,
            selectedIndex: 0,
            onSelect: (final int index) {
              return;
            },
          ),
        ),
      );

      // Check if the widget is present in the widget tree
      expect(find.byType(ElevatedNavigationBar), findsOneWidget);
    });

    testWidgets('Changes backgroundColor', (final tester) async {
      const Color newBackgroundColor = Colors.red;

      await tester.pumpWidget(
        MaterialApp(
          home: ElevatedNavigationBar(
            backgroundColor: Colors.blue,
            destinations: destinations,
            selectedIndex: 0,
            onSelect: (final int index) {
              return;
            },
          ),
        ),
      );

      // Find the widget and change its properties
      final Finder finder = find.byType(ElevatedNavigationBar);
      expect(finder, findsOneWidget);

      await tester.pumpWidget(
        MaterialApp(
          home: ElevatedNavigationBar(
            backgroundColor: newBackgroundColor,
            destinations: destinations,
            selectedIndex: 0,
            onSelect: (final int index) {
              return;
            },
          ),
        ),
      );

      // Check if the property was changed
      expect(
        tester.widget<ElevatedNavigationBar>(finder).backgroundColor,
        newBackgroundColor,
      );
    });
  });
}
