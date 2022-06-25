import 'package:firebase_authentication/providers/auth_provider.dart';
import 'package:firebase_authentication/ui/vm/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginController extends StateNotifier<LoginState> {
  LoginController(this.ref) : super(const LoginStateInitial());

  final Ref ref;

  void login(String email, String password) async {
    state = const LoginStateLoading();
    try {
      await ref.read(authRepositoryProvider).signInWithEmailAndPassword(
            email,
            password,
          );
      state = const LoginStateSuccess();
    } catch (e) {
      state = LoginStateError(e.toString());
    }
  }

  void signOut() async {
    await ref.read(authRepositoryProvider).signOut();
  }
}

final loginControllerProvider =
    StateNotifierProvider<LoginController, LoginState>((ref) {
  return LoginController(ref);
});
