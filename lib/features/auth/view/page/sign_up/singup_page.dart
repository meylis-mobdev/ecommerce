// ignore_for_file: no_leading_underscores_for_local_identifiers
import 'package:e_commerce/features/auth/view/page/sign_up/signup_view.dart';
import 'package:e_commerce/features/auth/viewModel/bloc/auth_bloc.dart';
import 'package:e_commerce/features/auth/viewModel/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class SingUpPage extends StatelessWidget {
  const SingUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormBuilderState>();
    final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
    final _usernameFieldKey = GlobalKey<FormBuilderFieldState>();
    final _lastnameFieldKey = GlobalKey<FormBuilderFieldState>();
    final _passwordFieldKey = GlobalKey<FormBuilderFieldState>();

    final authBloc = context.read<AuthBloc>();

    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          return SignupView(
            _formKey,
            _emailFieldKey,
            _usernameFieldKey,
            _lastnameFieldKey,
            _passwordFieldKey,
            state,
          );
        },
      ),
    );
  }
}
