import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit/features/auth/repository/auth_repository.dart';

/// AuthController will have direct communication with the UI

// Provider is read only widget.
// ref is a type provider ref.
// allows to contact with other provider.
final AuthControllerProvider = Provider(
  (ref) => AuthController(
    // getting the authRepositoryProvider
    authRepository: ref.read(authRepositoryProvider),
  ),
);

class AuthController {
  // private variable from AuthRepository class
  final AuthRepository _authRepository;
  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  void signInWithGoogle() {
    _authRepository.signInWithGoogle();
  }
}
