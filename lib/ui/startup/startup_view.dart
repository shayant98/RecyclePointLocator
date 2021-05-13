import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rpl/ui/startup/startup_viewmodel.dart';
import 'package:stacked/stacked.dart';

class StartupView extends StatelessWidget {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<StartupViewModel>.reactive(
      onModelReady: (model) =>
          SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
        model.runStartupLogic();
      }),
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => StartupViewModel(),
    );
  }
}
