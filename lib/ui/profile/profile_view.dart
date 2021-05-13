import 'package:flutter/material.dart';
import 'package:rpl/ui/profile/profile_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProfileViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => ProfileViewModel(),
    );
  }
}
