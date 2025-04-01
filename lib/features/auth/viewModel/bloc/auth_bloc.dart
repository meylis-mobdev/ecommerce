import 'package:bloc/bloc.dart';
import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/features/auth/model/service/auth_service.dart';
import 'package:e_commerce/features/auth/viewModel/bloc/auth_event.dart';
import 'package:e_commerce/features/auth/viewModel/bloc/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(FormDataState()) {
    on<UserNameEvent>((event, emit) {
      if (state is FormDataState) {
        emit((state as FormDataState).update(username: event.username));
      }
    });
    on<LastNameEvent>((event, emit) {
      if (state is FormDataState) {
        emit((state as FormDataState).update(lastname: event.lastname));
      }
    });
    on<EmailEvent>((event, emit) {
      if (state is FormDataState) {
        emit((state as FormDataState).update(email: event.email));
      }
    });
    on<FormSubmitted>((event, emit) async {
      if (state is! FormDataState) return;
      final formState = state as FormDataState;
      final username = formState.username,
          lastname = formState.lastname,
          email = formState.email;

      emit(FormLoadingState());

      Map<String, String> data = {
        "username": username,
        "lastname": lastname,
        "email": email,
        'password': 'static password',
      };

      try {
        AuthService().signUp(data);
        emit(FormSuccessState());
      } catch (e, stackTrace) {
        logger.e(e, stackTrace: stackTrace);
      }
    });
    // on<PasswordEvent>((event, emit) {
    //   if (state is FormSuccessState) {
    //     emit(FormDataState().update(password: event.password));
    //   }
    // });
  }
}
