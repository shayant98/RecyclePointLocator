import 'package:flutter/material.dart';
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
          body: Stack(
        children: [
          LeafClipper(),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingSmall),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                      color: kEmeraldGreen,
                      icon: Icon(Icons.arrow_back),
                      onPressed: model.navigateToHome),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                child: Text("Profile", style: kTitleTextStyle),
              ),
              verticalSpaceRegular,
              CircleAvatar(
                  backgroundColor: kEmeraldGreen,
                  radius: 100,
                  backgroundImage: NetworkImage(model.user!.image ?? '')),
              verticalSpaceRegular,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                child: Text("Personal info",
                    style: kTitleTextStyle.copyWith(fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingTiny),
                child: ListTile(
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
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingTiny),
                child: ListTile(
                  leading: Icon(
                    Icons.person,
                    color: kEmeraldGreen,
                  ),
                  title: Text(model.user!.name!),
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                child: Text("Security",
                    style: kTitleTextStyle.copyWith(fontSize: 18)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingTiny),
                child: ListTile(
                  title: Text(
                    "CHANGE PASSWORD",
                    style: kButtonTextStyle.copyWith(
                        fontWeight: FontWeight.bold, color: kEmeraldGreen),
                  ),
                ),
              ),
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                child: Text("Danger zone",
                    style: kTitleTextStyle.copyWith(fontSize: 18)),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingTiny),
                child: ListTile(
                  title: Text(
                    "DELETE ACCOUNT",
                    style: kButtonTextStyle.copyWith(
                        fontWeight: FontWeight.bold, color: kDangerRed),
                  ),
                ),
              ),
            ],
          ),
        ],
      )),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
