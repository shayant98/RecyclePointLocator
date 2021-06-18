import 'package:flutter/material.dart';
import 'package:rpl/ui/support/support_viewmodel.dart';
import 'package:stacked/stacked.dart';

class SupportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SupportViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => SupportViewModel(),
    );
  }
}
