
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screens/login_screen.dart';
import 'cubits/auth_cubit.dart';

void main() {
	runApp(MyApp());
}

class MyApp extends StatelessWidget {
	@override
	Widget build(BuildContext context) {
		return MultiBlocProvider(
			providers: [
				BlocProvider<AuthCubit>(
					create: (context) => AuthCubit(
						defaultEmail: 'zharfan@gmail.com',
						defaultPassword: 'cat',
					),
				),
			],
			child: MaterialApp(
				title: 'Simple App',
				theme: ThemeData(
					primarySwatch: Colors.blue,
				),
				home: LoginScreen(
					loginButtonText: 'Login Yuk',
				),
			),
		);
	}
}
