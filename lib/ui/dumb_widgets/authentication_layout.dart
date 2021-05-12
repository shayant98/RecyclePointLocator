import 'package:flutter/material.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';

class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final Widget form;
  final Function onMainAccountTapped;
  final Function onCreateAccountTapped;
  final Function onForgetPasswordTapped;
  final Function onBackPressed;
  final String validationMessage;
  final bool busy;

  const AuthenticationLayout(
      {Key key,
      this.title,
      this.subtitle,
      this.mainButtonTitle,
      this.form,
      this.onMainAccountTapped,
      this.onCreateAccountTapped,
      this.onForgetPasswordTapped,
      this.onBackPressed,
      this.validationMessage,
      this.busy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: ListView(
        children: [
          onBackPressed == null ?? verticalSpaceLarge,
          onBackPressed != null ?? verticalSpaceRegular,
          onBackPressed != null ??
              IconButton(
                  icon: Icon(Icons.arrow_back_ios), onPressed: onBackPressed),
        ],
      ),
    );
  }
}
