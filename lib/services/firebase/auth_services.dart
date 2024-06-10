import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';

import '../../models/user_model.dart';
import '../../utils/utils.dart';

class AuthService extends GetxService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Create a user with email and password
  Future<User?> signup(String email, String password, String name, String phone,
      String address) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;
      if (user != null) {
        // Create a new user document in Firestore
        UserModel userModel = UserModel(
          uid: user.uid,
          name: name,
          phone: phone,
          email: email,
          address: address,
        );
        await _firestore
            .collection('users')
            .doc(user.uid)
            .set(userModel.toMap());
      }
      return user;
    } on FirebaseException catch (e) {
      Utils.showSnackBar(e.message.toString());

      return null;
    }
  }

  // Sign in with email and password
  Future<User?> login(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseException catch (e) {
      Utils.showSnackBar(e.message.toString());

      return null;
    }
  }

  // Sign out
  Future<void> logout() async {
    await _auth.signOut();
  }

  // Reset password
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      Utils.showSnackBar('Password reset email sent');
    } on FirebaseException catch (e) {
      Utils.showSnackBar(e.message.toString());
    }
  }

  // Check if user is signed in
  User? get currentUser => _auth.currentUser;

  // Auth state changes
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  // Get user details from Firestore
  Future<UserModel?> getUserDetails(String uid) async {
    try {
      DocumentSnapshot doc =
          await _firestore.collection('users').doc(uid).get();
      if (doc.exists) {
        return UserModel.fromMap(doc.data() as Map<String, dynamic>);
      }
    } on FirebaseException catch (e) {
      Utils.showSnackBar(e.message.toString());
    }
    return null;
  }

  static Future<UserModel> getUser() async {
    UserModel user = UserModel();
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();

      if (snapshot.docs.isNotEmpty) {
        user = UserModel.fromMap(
            snapshot.docs.first.data() as Map<String, dynamic>);
      }
    } catch (e) {
      print("Error while getting user $e");
    }
    return user;
  }
}
