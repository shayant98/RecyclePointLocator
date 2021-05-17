import 'package:flutter/material.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/ui/dumb_widgets/recycle_point_tile.dart';

class RecyclePointList extends StatelessWidget {
  final ScrollController controller;
  final List<RecyclePoint> recyclePoints;

  const RecyclePointList({Key? key, required this.controller, required this.recyclePoints}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        controller: controller, // assign controller here
        itemCount: this.recyclePoints.length,
        itemBuilder: (_, index) => RecyclePointTile(
              recyclePoint: recyclePoints[index],
              showFavouriteIcon: false,
            ));
  }
}
