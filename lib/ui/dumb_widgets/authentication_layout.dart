import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';

class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final Widget form;
  final void Function()? onMainAccountTapped;
  final void Function()? onSignInWithGoogle;
  final void Function()? onCreateAccountTapped;
  final void Function()? onForgetPasswordTapped;
  final void Function()? onBackPressed;
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
      this.busy = false,
      required this.onSignInWithGoogle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (onBackPressed != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingSmall),
              child: IconButton(
                  color: kEmeraldGreen,
                  icon: Icon(Icons.arrow_back_ios),
                  onPressed: onBackPressed),
            ),
          verticalSpaceSmall,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
            child: Text(
              title,
              style: kTitleTextStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
            child: Text(
              subtitle,
              style: kSubtitleTextStyle,
            ),
          ),
          verticalSpaceLarge,
          form,
          verticalSpaceMedium,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
            child: Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: kEmeraldGreen,
                child: busy!
                    ? Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(kPlatinum),
                        ),
                      )
                    : Text(
                        mainButtonTitle,
                        style: kButtonTextStyle,
                      ),
              ),
            ),
          ),
          verticalSpaceLarge,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'OR',
                style: kBodyTextStyle,
              )
            ],
          ),
          verticalSpaceRegular,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
            child: MaterialButton(
              onPressed: onSignInWithGoogle,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: Colors.white,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Center(
                    child: Text(
                      'Sign in with Google',
                      style:
                          kBodyTextStyle.copyWith(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
          verticalSpaceRegular,
          if (onCreateAccountTapped != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: onCreateAccountTapped as void Function(),
                  child: Text(
                    'CREATE AN ACOUNT',
                    style: kBodyTextStyle.copyWith(
                        fontWeight: FontWeight.bold, color: kEmeraldGreen),
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}
