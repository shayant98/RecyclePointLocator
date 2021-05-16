import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';

class RecyclePointTile extends StatelessWidget {
  final RecyclePoint recyclePoint;

  const RecyclePointTile({Key? key, required this.recyclePoint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
      child: Container(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              flex: 1,
              child: Icon(
                FontAwesomeIcons.recycle,
                color: kEmeraldGreen,
                size: 32,
              ),
            ),
            horizontalSpaceSmall,
            Expanded(
              flex: 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        recyclePoint.name,
                        style: kBodyTextStyle.copyWith(fontWeight: FontWeight.w500),
                      ),
                      Row(
                        children: [
                          if (recyclePoint.materials.contains('glass'))
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: kEmeraldGreen,
                              foregroundColor: kPlatinum,
                              child: Icon(
                                FontAwesomeIcons.glassMartini,
                                size: 8,
                              ),
                            ),
                          horizontalSpaceTiny,
                          if (recyclePoint.materials.contains('paper'))
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: kEmeraldGreen,
                              foregroundColor: kPlatinum,
                              child: Icon(
                                FontAwesomeIcons.box,
                                size: 8,
                              ),
                            ),
                          horizontalSpaceTiny,
                          if (recyclePoint.materials.contains('plastic'))
                            CircleAvatar(
                              radius: 10,
                              backgroundColor: kEmeraldGreen,
                              foregroundColor: kPlatinum,
                              child: Icon(
                                FontAwesomeIcons.shoppingBag,
                                size: 8,
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                  verticalSpaceTiny,
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        color: kEmeraldGreen,
                        size: 14,
                      ),
                      Text(
                        recyclePoint.adres,
                        style: kBody2TextStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                    icon: Icon(
                      Icons.favorite_outline,
                      color: kEmeraldGreen,
                    ),
                    onPressed: () {}),
              ),
            )
          ],
        ),
      ),
    );
  }
}
