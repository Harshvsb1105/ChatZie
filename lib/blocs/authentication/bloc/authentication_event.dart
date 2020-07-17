part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent extends Equatable {
  AuthenticationEvent([List props = const <dynamic>[]]) : super();
}

class AppLaunched extends AuthenticationEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'AppLaunched';
}

class ClickedGoogleLogin extends AuthenticationEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ClickedGoogleLogin';
}

class LoggedIn extends AuthenticationEvent {
  final FirebaseUser user;
  LoggedIn(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'LoggedIn';
}

class PickedProfilePicture extends AuthenticationEvent {
  final File file;
  PickedProfilePicture(this.file);

  @override
  List<Object> get props => [file];

  @override
  String toString() => 'PickedProfilePicture';
}

class SaveProfile extends AuthenticationEvent {
  final File profileImage;
  final int age;
  final String username;
  SaveProfile(this.profileImage, this.age, this.username);

  @override
  List<Object> get props => [profileImage, age, username];

  @override
  String toString() => 'SaveProfile';
}

class ClickedLogout extends AuthenticationEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'ClickedLogout';
}
