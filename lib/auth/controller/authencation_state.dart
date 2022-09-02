// part of 'authentication_controller.dart';

// import 'package:equatable/equatable.dart';
// import 'package:player/auth/auth_user.dart';

// enum AuthenticationStatus {
//   authenticated,
//   unauthenticated,
// }

// class AuthenticationState extends Equatable {
//   final AuthenticationStatus status;
//   final AuthUser user;

//   const AuthenticationState._({
//     required this.status,
//     this.user = AuthUser.empty,
//   });

//   const AuthenticationState.authenticated(AuthUser user)
//       : this._(status: AuthenticationStatus.authenticated, user: user);

//   const AuthenticationState.unauthenticated()
//       : this._(status: AuthenticationStatus.unauthenticated);

//   @override
//   List<Object> get props => [status, user];
// }
