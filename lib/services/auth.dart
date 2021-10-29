import 'package:coffee_firebase_demo/models/user.dart';
import 'package:coffee_firebase_demo/services/database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on FirebaseUser
  AnonUser _userFromFirebaseUser(User user) {
    return user != null ? AnonUser(uid: user.uid) : null;
  }

  EmailAndPassUser _emailAndPassUserFromFirebaseUser(User user) {
    return user != null ? EmailAndPassUser(uid: user.uid) : null;
  }

  // auth change user stream
  Stream<AnonUser> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  // sign in with email & password
  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;
      return _emailAndPassUserFromFirebaseUser(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  // register with email & password
  Future registerWithEmailAndPassword(String email, String password) async {
    try {
      // create user
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      User user = result.user;

      // create a new document for the user with the uid
      await DatabaseService(uid: user.uid)
          .updateUserData('0', 'new crew member', 100);

      return _emailAndPassUserFromFirebaseUser(user);
    } catch (err) {
      print(err.toString());
      return null;
    }
  }

  // sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (err) {
      print(err.toString());
    }
  }
}
