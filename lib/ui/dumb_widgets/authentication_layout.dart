import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rpl/app/locale_keys.g.dart';
import 'package:rpl/ui/dumb_widgets/base_leaf_layout.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:easy_localization/easy_localization.dart';

class AuthenticationLayout extends StatelessWidget {
  final String title;
  final String subtitle;
  final String mainButtonTitle;
  final Widget form;
  final void Function()? onMainButtonTapped;
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
      this.onMainButtonTapped,
      this.onCreateAccountTapped,
      this.onForgetPasswordTapped,
      required this.onBackPressed,
      this.validationMessage,
      this.busy = false,
      required this.onSignInWithGoogle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseLeafLayout(
      child: ListView(
        children: [
          if (onBackPressed != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingSmall),
              child: Align(
                alignment: Alignment.centerLeft,
                child: IconButton(color: kEmeraldGreen, icon: Icon(Icons.arrow_back), onPressed: onBackPressed),
              ),
            ),
          verticalSpaceSmall,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
            child: Text(
              title,
              style: kTitleTextStyle,
            ).tr(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
            child: Text(
              subtitle,
              style: kSubtitleTextStyle,
            ).tr(),
          ),
          verticalSpaceMedium,
          form,
          verticalSpaceMedium,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
            child: Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: onMainButtonTapped,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                color: kEmeraldGreen,
                child: busy!
                    ? SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(kPlatinum),
                          ),
                        ),
                      )
                    : Text(
                        mainButtonTitle,
                        style: kButtonTextStyle,
                      ).tr(),
              ),
            ),
          ),
          verticalSpaceRegular,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
            child: MaterialButton(
              elevation: 2,
              onPressed: onSignInWithGoogle,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
              color: Colors.white,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Icon(
                    FontAwesomeIcons.google,
                    color: kDarkJungleGreen,
                  ),
                  // horizontalSpaceMedium,
                  Text(LocaleKeys.login_google_button, style: kButtonTextStyle.copyWith(color: kDarkJungleGreen)).tr(),
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
                    LocaleKeys.login_create_account_button,
                    style: kBodyTextStyle.copyWith(fontWeight: FontWeight.bold, color: kEmeraldGreen),
                  ).tr(),
                )
              ],
            ),
        ],
      ),
    );
  }
}
