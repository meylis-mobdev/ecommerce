abstract class AuthEvent {}

class FormSubmitted extends AuthEvent {}

class UserNameEvent extends AuthEvent {
  final String username;
  UserNameEvent(this.username);
}

class LastNameEvent extends AuthEvent {
  final String lastname;
  LastNameEvent(this.lastname);
}

class EmailEvent extends AuthEvent {
  final String email;
  EmailEvent(this.email);
}

class PasswordEvent extends AuthEvent {}
