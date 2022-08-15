// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/foundation.dart';
import 'package:social/models/user_model.dart';
import 'package:social/product/constants/firebase.dart';

class FirestoreService {
  Future? insertUser({required UserModel user}) async {
    try {
      final _user = user.toJson();
      final _authUser = await firebaseAuth.createUserWithEmailAndPassword(
          email: user.email, password: user.password);

      await usersRef.doc(_authUser.user!.uid).set(_user);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
