import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player/auth/auth_repo.dart';
import 'package:player/auth/authenticationa_repo.dart';
import 'package:player/auth/forgotpassword/forgot_password.dart';
import 'package:player/models/form_validators.dart';


final forgotPasswordProvider =
    StateNotifierProvider.autoDispose<ForgotPasswordController, ForgotPasswordState>(
  (ref) => ForgotPasswordController(
    ref.watch(authRepoProvider),
  ),
);

class ForgotPasswordController extends StateNotifier<ForgotPasswordState> {
  final AuthenticationRepository _authenticationRepository;

  ForgotPasswordController(this._authenticationRepository)
      : super(const ForgotPasswordState());

  void onEmailChange(String value) {
    final email = Email.dirty(value);

    state = state.copyWith(
      email: email,
      status: Formz.validate(
        [email],
      ),
    );
  }

  Future<void> forgotPassword() async {
    if (!state.status.isValidated) return;
    state = state.copyWith(status: FormzStatus.submissionInProgress);
    try {
      await _authenticationRepository.forgotPassword(email: state.email.value);
      state = state.copyWith(status: FormzStatus.submissionSuccess);
    } on ForgotPasswordFailure catch (e) {
      state = state.copyWith(
          status: FormzStatus.submissionFailure, errorMessage: e.code);
    }
  }
}
