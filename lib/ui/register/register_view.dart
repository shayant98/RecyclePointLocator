import 'package:flutter/material.dart';
import 'package:rpl/ui/dumb_widgets/authentication_layout.dart';
import 'package:rpl/ui/dumb_widgets/input_field.dart';
import 'package:rpl/ui/register/register_view.form.dart';
import 'package:rpl/ui/register/register_viewmodel.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
  FormTextField(name: 'confirmPassword'),
])
class RegisterView extends StatelessWidget with $RegisterView {
  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: AuthenticationLayout(
          busy: model.isBusy,
          onBackPressed: () {},
          onMainAccountTapped: () {},
          onSignInWithGoogle: model.useGoogleAuthentication,
          form: Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
            child: Column(
              children: [
                InputField(
                    controller: emailController,
                    inputType: TextInputType.text,
                    hint: 'Firstname',
                    label: 'Firstname',
                    isPassword: false),
                verticalSpaceMedium,
                InputField(
                    controller: emailController,
                    inputType: TextInputType.text,
                    hint: 'Lastname',
                    label: 'Lastname',
                    isPassword: false),
                verticalSpaceMedium,
                InputField(
                    controller: emailController,
                    inputType: TextInputType.emailAddress,
                    hint: 'Email',
                    label: 'Email',
                    isPassword: false),
                verticalSpaceMedium,
                InputField(
                    controller: passwordController,
                    inputType: TextInputType.visiblePassword,
                    hint: 'Enter Password',
                    label: 'Password',
                    isPassword: true),
                verticalSpaceMedium,
                InputField(
                    controller: confirmPasswordController,
                    inputType: TextInputType.visiblePassword,
                    hint: 'Repeat Password',
                    label: 'Repeat Password',
                    isPassword: true),
              ],
            ),
          ),
          mainButtonTitle: 'SUBMIT',
          subtitle: 'Fill in the required fields to create an account',
          title: 'Create an account',
        ),
      ),
      viewModelBuilder: () => RegisterViewModel(),
    );
  }
}
