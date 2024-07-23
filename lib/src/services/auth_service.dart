import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:logger/logger.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Logger _logger = Logger();

  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      _logger.e('Login failed: $e');
      rethrow;
    }
  }

  Future<User?> signUp(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } catch (e) {
      _logger.e('Signup failed: $e');
      rethrow;
    }
  }

  Future<void> storeUserData(String userId, String email, String name, String phoneNumber, String address) async {
    try {
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      await firestore.collection('users').doc(userId).set({
        'email': email,
        'name': name,
        'phoneNumber': phoneNumber,
        'address': address,
      });
      _logger.i('User data stored successfully.');
    } catch (e) {
      _logger.e('Error storing user data: $e');
      rethrow;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      _logger.e('Sign out failed: $e');
      rethrow;
    }
  }
}
