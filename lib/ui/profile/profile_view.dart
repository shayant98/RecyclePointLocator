import 'package:flutter/material.dart';
import 'package:rpl/app/locale_keys.g.dart';
import 'package:rpl/ui/dumb_widgets/floating_container.dart';
import 'package:rpl/ui/dumb_widgets/leaf_clipper.dart';
import 'package:rpl/ui/profile/profile_viewmodel.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
          // extendBodyBehindAppBar: true,
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   iconTheme: IconThemeData(color: kEmeraldGreen),
          //   elevation: 0,
          // ),
          body: Stack(
        children: [
          LeafClipper(),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingSmall),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(color: kEmeraldGreen, icon: Icon(Icons.arrow_back), onPressed: model.navigateToHome),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                child: Text(LocaleKeys.profile_title, style: kTitleTextStyle).tr(),
              ),
              verticalSpaceRegular,
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: kEmeraldGreen,
                    radius: 100,
                    backgroundImage: NetworkImage(model.user!.image ?? ''),
                  ),
                ],
              ),
              verticalSpaceLarge,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: paddingRegular,
                ),
                child: _BuildInfoContainer(),
              ),
            ],
          ),
        ],
      )),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}

class _BuildInfoContainer extends ViewModelWidget<ProfileViewModel> {
  @override
  Widget build(BuildContext context, ProfileViewModel model) {
    return FloatingContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(LocaleKeys.profile_card_personal_title, style: kHeadingTextStyle).tr(),
          ListTile(
            leading: Icon(
              Icons.email,
              color: kEmeraldGreen,
            ),
            title: Text(model.user!.email!),
            trailing: Icon(
              Icons.verified_user,
              color: kEmeraldGreen,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: kEmeraldGreen,
            ),
            title: Text(model.user!.name!),
          ),
          verticalSpaceMedium,
          Text(LocaleKeys.profile_card_security_title, style: kHeadingTextStyle).tr(),
          ListTile(
            title: Text(
              LocaleKeys.profile_card_change_password,
              style: kButtonTextStyle.copyWith(fontWeight: FontWeight.bold, color: kEmeraldGreen),
            ).tr(),
          ),
          verticalSpaceMedium,
          Text(LocaleKeys.profile_card_danger_title, style: kHeadingTextStyle).tr(),
          Divider(),
          ListTile(
            onTap: model.showDeleteSheet,
            title: Text(
              LocaleKeys.profile_card_delete_account,
              style: kButtonTextStyle.copyWith(fontWeight: FontWeight.bold, color: kDangerRed),
            ).tr(),
          ),
        ],
      ),
    );
  }
}
