import 'package:ads_app/core/utils/utils.dart';
import 'package:ads_app/models/user/user_model.dart';
import 'package:ads_app/repositories/auth_repository.dart';
import 'package:flutter/material.dart';

enum AuthEnum {
  signIn,
  signUp,
}

class AuthViewModel extends ChangeNotifier {
  final AuthRepository _authRepository = AuthRepository();
  UserModel? _user;
  UserModel? get user => _user;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  AuthEnum _authEnum = AuthEnum.signIn;
  AuthEnum get authEnum => _authEnum;

  AuthViewModel() {
    _authRepository.userChanges.listen((user) {
      _user = user;
      notifyListeners();
    });
  }

  set authEnum(AuthEnum value) {
    _authEnum = value;
    print(value);
    notifyListeners();
  }

  // Future<void> signInWithGoogle() async {
  //   _isLoading = true;
  //   notifyListeners();
  //   try {
  //     _user = await _authRepository.signInWithGoogle();
  //   } catch (e) {
  //     print(e);
  //   } finally {
  //     _isLoading = false;
  //     notifyListeners();
  //   }
  // }

  Future<void> signInWithEmailAndPassword(
       String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      _user = await _authRepository.signInWithEmailAndPassword(email, password);
    } catch (e) {
      snackBar( title: e.toString().split("]")[1]);

      print(e);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> registerWithEmailAndPassword(
      BuildContext context, String email, String password) async {
    _isLoading = true;
    notifyListeners();
    try {
      _user =
          await _authRepository.registerWithEmailAndPassword(email, password);
      notifyListeners();
    } catch (e) {
      print(e);
      snackBar( title: e.toString().split("]")[1]);
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
    _user = null;
    notifyListeners();
  }
}
