import 'package:flutter/material.dart';
import 'package:rpl/ui/register/register_viewmodel.dart';
import 'package:stacked/stacked.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<RegisterViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => RegisterViewModel(),
    );
  }
}
