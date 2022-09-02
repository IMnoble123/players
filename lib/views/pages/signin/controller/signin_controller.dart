

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player/auth/auth_repo.dart';
import 'package:player/auth/authenticationa_repo.dart';
import 'package:player/models/form_validators.dart';
import 'package:player/views/pages/signin/controller/signin_state.dart';

final signInProvider =
    StateNotifierProvider.autoDispose<SignInController, SignInState>(
  (ref) => SignInController(ref.watch(authRepoProvider)),
);

class SignInController extends StateNotifier<SignInState> {
  final AuthenticationRepository _authenticationRepository;
  SignInController(this._authenticationRepository) : super(const SignInState());

  void onEmailChange(String value) {
    final email = Email.dirty(value);

    state = state.copyWith(
      email: email,
      status: Formz.validate([email, state.password]),
    );
  }

  void onPasswordChange(String value) {
    final password = Password.dirty(value);
    state = state.copyWith(
      password: password,
      status: Formz.validate([state.email, password]),
    );
  }

  void signInWithEmailAndPassword() async {
    if (!state.status.isValidated) return;
    state = state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      await _authenticationRepository.signInWithEmailAndPassword(
        email: state.email.value,
        password: state.password.value,
      );

      state = state.copyWith(status: FormzStatus.submissionSuccess);
    } on SignInWithEmailAndPasswordFailure catch (e) {
      state = state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: e.code);
    }
  }
}