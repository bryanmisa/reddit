import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:reddit/core/constants/firebase_constants.dart';
import 'package:reddit/core/providers/firebase_providers.dart';
import 'package:reddit/models/user_model.dart';
import 'package:reddit/core/constants/constants.dart';

// AuthRepository has no direct communication with the UI
// ref. is usualy used outside the build context it wont allow you to make
// any changes.
// The AuthRepository class

// Using Provider
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

  CollectionReference get _users =>
      _firestore.collection(FirebaseConstants.usersCollection);

  // SignIn with Google with try and catch block
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
      // UserCredential is from firebase_auth package
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);

      // Initializing UserModel from the user_model.dart
      // user!.displayName are based in firebase_auth.dart
      UserModel userModel = UserModel(
        name: userCredential.user!.displayName ?? 'No Name',
        profilePic: userCredential.user!.photoURL ?? Constants.avatarDefault,
        banner: Constants.bannerDefault,
        uid: userCredential.user!.uid,
        isAuthenticated: true,
        karma: 0,
        awards: [],
      );

      // Setting the userModel to FireBase.
      // By using UserModel.toMap() we can avoid repeating the multiple line 
      //  of codes.
      // Since set is Future, need to add await
      await _users.doc(userCredential.user!.uid).set({userModel.toMap()});
    } catch (e) {
      print(e);
    }
  }
}
