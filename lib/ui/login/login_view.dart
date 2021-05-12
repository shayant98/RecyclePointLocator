import 'package:flutter/material.dart';
import 'package:rpl/ui/dumb_widgets/authentication_layout.dart';
import 'package:rpl/ui/login/login_view.form.dart';
import 'package:rpl/ui/login/login_viewmodel.dart';
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
        body: AuthenticationLayout(
          busy: model.isBusy,
          title: 'Login',
          subtitle: 'Enter your login credentials to continue',
          mainButtonTitle: 'LOGIN',
          form: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Email'),
                controller: emailController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Password'),
                controller: passwordController,
              )
            ],
          ),
          onBackPressed: () {},
        ),
      ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
