import 'package:e_commerce/core/utils/logger.dart';
import 'package:e_commerce/features/auth/model/service/auth_service.dart';
import 'package:e_commerce/features/auth/view/widgets/input.dart';
import 'package:e_commerce/features/auth/view/widgets/primary_button.dart';
import 'package:e_commerce/features/auth/viewModel/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class SignupView extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final GlobalKey<FormBuilderFieldState> usernameFieldKey;
  final GlobalKey<FormBuilderFieldState> lastnameFieldKey;
  final GlobalKey<FormBuilderFieldState> emailFieldKey;
  final GlobalKey<FormBuilderFieldState> passwordFieldKey;
  final state;

  const SignupView(
    this.formKey,
    this.usernameFieldKey,
    this.lastnameFieldKey,
    this.emailFieldKey,
    this.passwordFieldKey,
    this.state, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Create Account',
                style: TextStyle(
                  fontFamily: 'Manrope',
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                ),
              ),

              const SizedBox(height: 32),

              FormBuilder(
                key: formKey,
                child: Column(
                  spacing: 16,
                  children: [
                    Input(
                      inputKey: usernameFieldKey,
                      name: 'firstName',
                      labelText: 'First Name',
                    ),
                    Input(
                      inputKey: lastnameFieldKey,
                      name: 'lastName',
                      labelText: "Last Name",
                    ),
                    Input(
                      inputKey: emailFieldKey,
                      name: 'email',
                      labelText: "Email",
                      validatorsList: [FormBuilderValidators.email()],
                    ),
                    Input(
                      inputKey: passwordFieldKey,
                      name: 'password',
                      labelText: "Password",
                      isPassword: true,
                    ),
                    const SizedBox(height: 40 - 13),
                    SizedBox(
                      // width,
                      child: PrimaryButton(
                        'Continue',
                        widget:
                            state is FormLoadingState
                                ? CircularProgressIndicator()
                                : null,
                        onPressed: () async {
                          formKey.currentState?.saveAndValidate();

                          if (formKey.currentState!.isValid) {
                            var data = formKey.currentState!.value;
                            logger.i(data);
                            var res = await AuthService().signUp(data);
                            logger.i(res);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
