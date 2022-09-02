
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player/auth/auth_repo.dart';
import 'package:player/auth/authenticationa_repo.dart';

final googleSignInProvider =
    StateNotifierProvider<GoogleSignInController, GoogleSignInState>(
  (ref) {
    final authenticationRepository = ref.watch(authRepoProvider);
    return GoogleSignInController(authenticationRepository);
  },
);

enum GoogleSignInState {
  initial,
  loading,
  success,
  error,
}

class GoogleSignInController extends StateNotifier<GoogleSignInState> {
  final AuthenticationRepository _authenticationRepository;

  GoogleSignInController(this._authenticationRepository)
      : super(GoogleSignInState.initial);

  Future<void> signInWithGoogle() async {
    state = GoogleSignInState.loading;

    try {
      final isNewUser = await _authenticationRepository.signInWithGoogle();

      if (isNewUser != null && isNewUser) {
        // white to database
        // call cloud firestore repository
      }

      state = GoogleSignInState.success;
    } on SignInWithGoogleFailure catch (_) {
      state = GoogleSignInState.error;
    }
  }
}