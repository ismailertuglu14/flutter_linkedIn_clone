// ignore_for_file: use_rethrow_when_possible

import 'package:firebase_auth/firebase_auth.dart';
import 'package:social/product/constants/firebase.dart';
import 'package:social/product/providers/auth_provider.dart';

class AuthService {
  User getCurrentUser() {
    User user = firebaseAuth.currentUser!;
    return user;
  }

  Future login({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      throw e;
    }
  }

  Future logOut({required AuthProvider provider}) async {
    await firebaseAuth.signOut();
    provider.logout();
    print('Sign Out!');
  }
}
