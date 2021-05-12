import 'package:flutter/material.dart';

class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final Widget form;
  final Function? onMainAccountTapped;
  final Function? onCreateAccountTapped;
  final Function? onForgetPasswordTapped;
  final Function onBackPressed;
  final String? validationMessage;
  final bool? busy;

  const AuthenticationLayout(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.mainButtonTitle,
      required this.form,
      this.onMainAccountTapped,
      this.onCreateAccountTapped,
      this.onForgetPasswordTapped,
      required this.onBackPressed,
      this.validationMessage,
      this.busy = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back_ios), onPressed: onBackPressed()),
          form,
        ],
      ),
    );
  }
}
