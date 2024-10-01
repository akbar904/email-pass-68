
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:simple_app/screens/login_screen.dart';

class MockAuthCubit extends MockCubit<AuthState> implements AuthCubit {}

void main() {
	group('LoginScreen Widget Tests', () {
		testWidgets('should display email and password text fields', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (context) => MockAuthCubit(),
						child: LoginScreen(),
					),
				),
			);

			expect(find.byType(TextFormField), findsNWidgets(2));
			expect(find.widgetWithText(TextFormField, 'Email'), findsOneWidget);
			expect(find.widgetWithText(TextFormField, 'Password'), findsOneWidget);
		});

		testWidgets('should display login button', (WidgetTester tester) async {
			await tester.pumpWidget(
				MaterialApp(
					home: BlocProvider<AuthCubit>(
						create: (context) => MockAuthCubit(),
						child: LoginScreen(),
					),
				),
			);

			expect(find.widgetWithText(ElevatedButton, 'Login'), findsOneWidget);
		});
	});

	group('LoginScreen Cubit Tests', () {
		late AuthCubit authCubit;

		setUp(() {
			authCubit = MockAuthCubit();
		});

		blocTest<AuthCubit, AuthState>(
			'should emit LoginSuccess when login is successful',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'password123'),
			expect: () => [isA<LoginSuccess>()],
		);

		blocTest<AuthCubit, AuthState>(
			'should emit LoginFailure when login fails',
			build: () => authCubit,
			act: (cubit) => cubit.login('test@example.com', 'wrongpassword'),
			expect: () => [isA<LoginFailure>()],
		);
	});
}
