import 'package:flutter/material.dart';
import 'package:rpl/ui/settings/settings_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => SettingsModel(),
    );
  }
}
