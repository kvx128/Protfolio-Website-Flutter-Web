import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:web_app/models/CustomUser.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  uploadImage(path) {
    Reference firebaseStorageReference =
        FirebaseStorage.instance.ref().child("profilepics/$path");
  }

  // create user obj based on firebase user
  CustomUser _userFromFirebaseUser(User user) {
    return user != null
        ? CustomUser(
            uid: user.uid,
            displayName: user.displayName,
            photoURL: user.photoURL)
        : null;
  }

  // auth change user stream
  Stream<CustomUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // // sign in anonymous
  // Future signInAnon() async {
  //   try {
  //     UserCredential result = await _auth.signInAnonymously();
  //     User user = result.user;
  //     return user;
  //     // return _userFromFirebseUser(user!);
  //   } catch (e) {
  //     print(e.toString());
  //     return null;
  //   }
  // }

  // // sign in or register with email and password
  // Future signInEmail(String email, String password) async {
  //   try {
  //     UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       print('No user found for that email.');
  //       try {
  //         UserCredential userCredential = await _auth
  //             .createUserWithEmailAndPassword(email: email, password: password);
  //       } on FirebaseAuthException catch (e) {
  //         if (e.code == 'weak-password') {
  //           print('The password provided is too weak.');
  //         } else if (e.code == 'email-already-in-use') {
  //           print('The account already exists for that email.');
  //         }
  //       } catch (e) {
  //         print(e);
  //       }
  //     } else if (e.code == 'wrong-password') {
  //       print('Wrong password provided for that user.');
  //     }
  //   }
  // }

  // sign in with email and password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      print(user);
      return user;
    } catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else {
        print(e.toString());
      }
    }
  }

  // register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, String displayName) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      print(user);
      user.updateDisplayName(displayName);
      user.updatePhotoURL("");
      // create a new document for the user with the uid
      //await DatabaseService(uid: user.uid).updateUserData('0','new crew member', 100);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
