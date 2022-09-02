import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player/auth/auth_repo.dart';
import 'package:player/auth/auth_user.dart';
import 'package:player/auth/authenticationa_repo.dart';


final authProvider = StateNotifierProvider<AuthController, AuthenticationState>(
  (ref) => AuthController(ref.watch(authRepoProvider)),
);

class AuthController extends StateNotifier<AuthenticationState> {
  final AuthenticationRepository _authRepository;
  late final StreamSubscription _streamSubscription;

  AuthController(this._authRepository)
      : super(const AuthenticationState.unauthenticated()) {
    _streamSubscription =
        _authRepository.user.listen((user) => _onUserChanged(user));
  }

  void _onUserChanged(AuthUser user) {
    if (user.isEmpty) {
      state = const AuthenticationState.unauthenticated();
    } else {
      state = AuthenticationState.authenticated(user);
    }
  }

  void onSignOut() {
    _authRepository.signOut();
  }

  @override
  void dispose() {
    _streamSubscription.cancel();
    super.dispose();
  }
}

class AuthenticationState {
  final AuthenticationStatus status;
  final AuthUser user;

  const AuthenticationState._({
    required this.status,
    this.user = AuthUser.empty,
  });

  const AuthenticationState.authenticated(AuthUser user)
      : this._(status: AuthenticationStatus.authenticated, user: user);

  const AuthenticationState.unauthenticated()
      : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object> get props => [status, user];
}
enum AuthenticationStatus {
  authenticated,
  unauthenticated,
}
 