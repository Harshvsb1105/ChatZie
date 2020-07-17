import 'package:chatzie/providers/BaseProviders.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationProvider extends BaseAuthenticationProvider {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  @override
  Future<FirebaseUser> signInWithGoogle() async {
    final GoogleSignInAccount account = await googleSignIn.signIn();
    final GoogleSignInAuthentication authentication =
        await account.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken);
    await firebaseAuth.signInWithCredential(credential);
    return firebaseAuth.currentUser();
  }

  @override
  Future<void> signOutUser() async {
    return Future.wait([
      firebaseAuth.signOut(),
      googleSignIn.signOut()
    ]); // terminate the session
  }

  @override
  Future<FirebaseUser> getCurrentUser() async {
    return await firebaseAuth.currentUser(); //retrieve the current user
  }

  @override
  Future<bool> isLoggedIn() async {
    final user =
        await firebaseAuth.currentUser(); //check if user is logged in or not
    return user != null;
  }
}
