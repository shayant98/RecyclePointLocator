import 'package:flutter/material.dart';
import 'package:rpl/app/locale_keys.g.dart';
import 'package:rpl/ui/dumb_widgets/authentication_layout.dart';
import 'package:rpl/ui/dumb_widgets/input_field.dart';
import 'package:rpl/ui/login/login_view.form.dart';
import 'package:rpl/ui/login/login_viewmodel.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [
  FormTextField(name: 'email'),
  FormTextField(name: 'password'),
])
class LoginView extends StatelessWidget with $LoginView {
  LoginView({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<LoginViewModel>.reactive(
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: AuthenticationLayout(
          busy: model.isBusy,
          title: LocaleKeys.login_title,
          subtitle: LocaleKeys.login_subtitle,
          mainButtonTitle: LocaleKeys.login_button,
          form: Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
            child: Column(
              children: [
                InputField(controller: emailController, inputType: TextInputType.emailAddress, hint: LocaleKeys.login_email_field, label: LocaleKeys.login_email_field, isPassword: false),
                verticalSpaceMedium,
                InputField(controller: passwordController, inputType: TextInputType.visiblePassword, hint: LocaleKeys.login_password_field, label: LocaleKeys.login_password_field, isPassword: true),
              ],
            ),
          ),
          onBackPressed: model.navigateToHome,
          onCreateAccountTapped: model.navigateToCreateAccount,
          onSignInWithGoogle: model.useGoogleAuthentication,
          onMainButtonTapped: model.saveData,
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
