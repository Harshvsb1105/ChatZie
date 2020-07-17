import 'package:chatzie/models/User.dart';
import 'package:chatzie/providers/BaseProviders.dart';
import 'package:chatzie/providers/UserDataProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDataRepository {
  BaseUserDataProvider userDataProvider = UserDataProvider();
  Future<User> saveDetailsFromGoogleAuth(FirebaseUser user) =>
      userDataProvider.saveDetailsFromGoogleAuth(user);

  Future<User> saveProfileDetails(
          String uid, String profileImageUrl, int age, String username) =>
      userDataProvider.saveProfileDetails(uid, profileImageUrl, age, username);

  Future<bool> isProfileComplete(String uid) =>
      userDataProvider.isProfileComplete(uid);
}
