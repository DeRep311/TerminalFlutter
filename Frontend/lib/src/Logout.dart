import 'package:firebase_auth/firebase_auth.dart';

class LogoutService {
  Future<void> logout() async {
    final auth = FirebaseAuth.instance;
    await auth.signOut();
  }
}
