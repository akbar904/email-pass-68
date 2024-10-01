
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/user.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
	final User user;
	AuthSuccess(this.user);
}

class AuthFailure extends AuthState {
	final String message;
	AuthFailure(this.message);
}

class AuthLoggedOut extends AuthState {}

class AuthCubit extends Cubit<AuthState> {
	AuthCubit() : super(AuthInitial());

	void login(String email, String password) async {
		try {
			emit(AuthLoading());
			// Simulate network delay
			await Future.delayed(Duration(seconds: 1));
			if (email == 'test@example.com' && password == 'password') {
				emit(AuthSuccess(User(id: '1', email: email)));
			} else {
				emit(AuthFailure('Login failed'));
			}
		} catch (e) {
			emit(AuthFailure('An error occurred'));
		}
	}

	void logout() async {
		try {
			emit(AuthLoading());
			// Simulate network delay
			await Future.delayed(Duration(seconds: 1));
			emit(AuthLoggedOut());
		} catch (e) {
			emit(AuthFailure('An error occurred'));
		}
	}
}
