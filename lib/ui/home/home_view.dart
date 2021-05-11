import 'package:flutter/material.dart';
import 'package:rpl/ui/home/home_viewmodel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}
