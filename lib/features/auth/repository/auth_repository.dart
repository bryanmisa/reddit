import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reddit/core/providers/firebase_providers.dart';

/// AuthRepository has no direct communication with the UI
/// ref. is usualy used outside the build context it wont allow you to make
/// any changes

/// Using Provider
final authRepositoryProvider = Provider(
  (ref) => AuthRepository(
    firestore: ref.read(firestroreProvider),
    auth: ref.read(authProvider),
    googleSignIn: ref.read(googleSignInProvider),
  ),
);

class AuthRepository {
  // variables should only be accessible inside the class
  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn;

  // You cannot directly assign this private variables to class constructor but
  // instead as to be create a new variable and assign.

  AuthRepository({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required googleSignIn,
  })  : _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  // SingIn with Google with try and catch block

  void signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // create variable for better reading of code.
      // ? changes the type of variable to nullable type.
      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        // or
        // accessToken: (await googleUser?.authentication)?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Make sure that the GoogleAuthentication in Firebase Site is enabled.
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      print(userCredential.user?.email);
    } catch (e) {
      print(e);
    }
  }
}
