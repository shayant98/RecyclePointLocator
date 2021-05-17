import 'package:flutter/material.dart';
import 'package:rpl/ui/dumb_widgets/floating_container.dart';
import 'package:rpl/ui/dumb_widgets/leaf_clipper.dart';
import 'package:rpl/ui/profile/profile_viewmodel.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: kEmeraldGreen),
            elevation: 0,
          ),
          body: Stack(
            children: [
              LeafClipper(),
              ListView(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: paddingSmall),
                  //   child: Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: IconButton(
                  //         color: kEmeraldGreen, icon: Icon(Icons.arrow_back), onPressed: model.navigateToHome),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                    child: Text("Profile", style: kTitleTextStyle),
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
          Text("Personal info", style: kHeadingTextStyle),
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
          Text("Security", style: kHeadingTextStyle),
          ListTile(
            title: Text(
              "CHANGE PASSWORD",
              style: kButtonTextStyle.copyWith(fontWeight: FontWeight.bold, color: kEmeraldGreen),
            ),
          ),
          verticalSpaceMedium,
          Text("Danger zone", style: kHeadingTextStyle),
          Divider(),
          ListTile(
            onTap: model.showDeleteSheet,
            title: Text(
              "DELETE ACCOUNT",
              style: kButtonTextStyle.copyWith(fontWeight: FontWeight.bold, color: kDangerRed),
            ),
          ),
        ],
      ),
    );
  }
}
