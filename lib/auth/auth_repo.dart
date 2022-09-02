import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:player/auth/authenticationa_repo.dart';


final authRepoProvider = Provider<AuthenticationRepository>(
  (_) => AuthenticationRepository(),
);
