import 'package:e_parking_system/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseExceptions {
  void handleFirebaseException(FirebaseException e) {
    String message;

    switch (e.code) {
      case 'user-not-found':
        message = 'No user found for that email.';
        break;
      case 'wrong-password':
        message = 'Wrong password provided for that user.';
        break;
      case 'email-already-in-use':
        message = 'The account already exists for that email.';
        break;
      default:
        message = 'An unknown error occurred.';
    }

    Utils.showSnackBar(message);
  }
}
