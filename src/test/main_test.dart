
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_app/main.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('MyApp', () {
		testWidgets('should render LoginScreen initially', (WidgetTester tester) async {
			await tester.pumpWidget(MyApp());

			expect(find.byType(LoginScreen), findsOneWidget);
		});
	});

	group('App Initialization', () {
		test('main initializes the app without errors', () {
			expect(() => main(), returnsNormally);
		});
	});
}
