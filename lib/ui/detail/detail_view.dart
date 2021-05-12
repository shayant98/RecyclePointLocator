import 'package:flutter/material.dart';
import 'package:rpl/ui/detail/detail_viewmodel.dart';
import 'package:stacked/stacked.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailViewModel>.reactive(
      builder: (context, model, child) => Scaffold(),
      viewModelBuilder: () => DetailViewModel(),
    );
  }
}
