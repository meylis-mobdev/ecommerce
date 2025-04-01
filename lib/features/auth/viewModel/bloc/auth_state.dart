abstract class AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;
  AuthErrorState(this.message);
}

class AuthSuccessState extends AuthState {
  final dynamic value;
  AuthSuccessState(this.value);
}

class FormSuccessState extends AuthState {}

class FormLoadingState extends AuthState {}

class FormErrorState extends AuthState {
  final String message;
  FormErrorState(this.message);
}

class FormDataState extends AuthState {
  final String username;
  final String lastname;
  final String email;
  final String password;
  final bool isSubmitting;
  final bool isSuccess;
  final String? error;

  FormDataState({
    this.username = '',
    this.lastname = '',
    this.email = '',
    this.password = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.error,
  });

  FormDataState update({
    String? username,
    String? lastname,
    String? email,
    String? password,
    bool? isSubmitting,
    bool? isSuccess,
    String? error,
  }) {
    return FormDataState(
      username: username ?? this.username,
      lastname: lastname ?? this.lastname,
      email: email ?? this.email,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error,
    );
  }
}
