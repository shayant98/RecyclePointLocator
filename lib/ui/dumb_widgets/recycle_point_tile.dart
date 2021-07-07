import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:stacked_themes/stacked_themes.dart';

class RecyclePointTile extends StatelessWidget {
  final RecyclePoint recyclePoint;
  final void Function()? onTap;
  final bool showFavouriteIcon;

  const RecyclePointTile({Key? key, required this.recyclePoint, this.onTap, this.showFavouriteIcon = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        color: getThemeManager(context).isDarkMode ? kPhthaloGreen : kPlatinum,
        child: InkWell(
          onTap: onTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: paddingTiny),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    FontAwesomeIcons.recycle,
                    color: kEmeraldGreen,
                    size: 36,
                  ),
                ),
                VerticalDivider(),
                horizontalSpaceMedium,
                Expanded(
                  flex: showFavouriteIcon ? 8 : 19,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            recyclePoint.name,
                            style: kBodyTextStyle.copyWith(fontWeight: FontWeight.w500),
                          ),
                          horizontalSpaceRegular,
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
                      Divider(),
                      verticalSpaceTiny,
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Icon(
                            Icons.location_on,
                            color: kEmeraldGreen,
                            size: 14,
                          ),
                          horizontalSpaceTiny,
                          Expanded(
                            child: Text(
                              recyclePoint.adres,
                              style: kBody2TextStyle,
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                if (showFavouriteIcon)
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
        ),
      ),
    );
  }
}
