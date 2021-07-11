import 'package:flutter/material.dart';
import 'package:rpl/app/locale_keys.g.dart';
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
  FormTextField(name: 'firstName'),
  FormTextField(name: 'lastName'),
])
class RegisterView extends StatelessWidget with $RegisterView {
  RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: AuthenticationLayout(
          busy: model.isBusy,
          onBackPressed: model.navigateBack,
          onMainButtonTapped: model.saveData,
          onSignInWithGoogle: model.useGoogleAuthentication,
          form: Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
            child: Column(
              children: [
                InputField(controller: firstNameController, inputType: TextInputType.text, hint: LocaleKeys.create_account_firstname_field, label: LocaleKeys.create_account_firstname_field, isPassword: false),
                verticalSpaceRegular,
                InputField(controller: lastNameController, inputType: TextInputType.text, hint: LocaleKeys.create_account_lastname_field, label: LocaleKeys.create_account_lastname_field, isPassword: false),
                verticalSpaceRegular,
                InputField(controller: emailController, inputType: TextInputType.emailAddress, hint: LocaleKeys.create_account_email_field, label: LocaleKeys.create_account_email_field, isPassword: false),
                verticalSpaceRegular,
                InputField(controller: passwordController, inputType: TextInputType.visiblePassword, hint: LocaleKeys.create_account_password_field, label: LocaleKeys.create_account_password_field, isPassword: true),
                verticalSpaceRegular,
                InputField(
                    controller: confirmPasswordController,
                    inputType: TextInputType.visiblePassword,
                    hint: LocaleKeys.create_account_repeat_password_field,
                    label: LocaleKeys.create_account_repeat_password_field,
                    isPassword: true),
              ],
            ),
          ),
          mainButtonTitle: LocaleKeys.create_account_button,
          subtitle: LocaleKeys.create_account_subtitle,
          title: LocaleKeys.create_account_title,
        ),
      ),
      viewModelBuilder: () => RegisterViewModel(),
    );
  }
}
