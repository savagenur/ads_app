// repositories/auth_repository.dart

import 'package:ads_app/models/user/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

 static String? get userId {
    return FirebaseAuth.instance.currentUser?.uid;
  }

  // Future<UserModel?> signInWithGoogle() async {
  //   final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //   print("object 1");
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;
  //   print("object 2");
  //   final AuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );
  //   print("object ${credential.accessToken}");
  //   final UserCredential userCredential =
  //       await _auth.signInWithCredential(credential);
  //   final User? user = userCredential.user;
  //   print("object ${user}");

  //   final userModel = UserModel(
  //     uid: user?.uid,
  //     displayName: user?.displayName,
  //     email: user?.email,
  //     photoURL: user?.photoURL,
  //   );
  //   print("object ${userModel}");

  //   if (user != null) {
  //     await _firestore.collection('users').doc(user.uid).set({
  //       'displayName': user.displayName,
  //       'email': user.email,
  //       'photoURL': user.photoURL,
  //     }, SetOptions(merge: true));
  //     print("object true");

  //     return userModel;
  //   } else {
  //     return null;
  //   }
  // }

  Future<void> signOut() async {
    await _auth.signOut();
    // await _googleSignIn.signOut();
  }

  Stream<UserModel?> get userChanges {
    return _auth.authStateChanges().map((User? user) {
      if (user == null) {
        return null;
      } else {
        return UserModel(
          uid: user.uid,
          displayName: user.displayName,
          email: user.email,
          photoURL: user.photoURL,
        );
      }
    });
  }

  Future<UserModel?> signInWithEmailAndPassword(
      String email, String password) async {
    final UserCredential userCredential = await _auth
        .signInWithEmailAndPassword(email: email, password: password);
    final User? user = userCredential.user;
    if (user != null) {
      return UserModel(
        uid: user.uid,
        displayName: user.displayName,
        email: user.email,
        photoURL: user.photoURL,
      );
    } else {
      return null;
    }
  }

  Future<UserModel?> registerWithEmailAndPassword(
      String email, String password) async {
    final UserCredential userCredential = await _auth
        .createUserWithEmailAndPassword(email: email, password: password);

    final User? user = userCredential.user;

    if (user != null) {
      await _firestore.collection('users').doc(user.uid).set({
        'displayName': user.displayName,
        'price':0.0,
        'email': user.email,
        'photoURL': user.photoURL,
      }, SetOptions(merge: true));
      return UserModel(
        uid: user.uid,
        displayName: user.displayName,
        email: user.email,
        photoURL: user.photoURL,
      );
    } else {
      return null;
    }
  }
}
