import 'package:flutter/material.dart';
import 'package:rpl/ui/dumb_widgets/floating_container.dart';
import 'package:rpl/ui/dumb_widgets/transparent_button.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:rpl/ui/smart_widgets/expanded_menu/expanded_menu_viewmodel.dart';
import 'package:stacked/stacked.dart';

class ExpandedMenuView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ExpandedMenuViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => SizedBox(
        width: screenWidthPercentage(context, percentage: 0.3),
        child: FloatingContainer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TransparentButton(
                onPressed: model.user != null ? model.navigatoToProfile : model.navigatoToLogin,
                child: Row(
                  children: [
                    Icon(
                      Icons.account_circle_outlined,
                      color: kEmeraldGreen,
                    ),
                    horizontalSpaceSmall,
                    if (model.user != null)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            model.user!.name!,
                            style: kBodyTextStyle,
                          ),
                          Text(
                            model.user!.email!,
                            style: kBody2TextStyle,
                          )
                        ],
                      )
                    else
                      Text(
                        'Sign in',
                        style: kBodyTextStyle,
                      )
                  ],
                ),
              ),
              Divider(),
              TransparentButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: kEmeraldGreen,
                    ),
                    horizontalSpaceSmall,
                    Text(
                      'Settings',
                      style: kBodyTextStyle,
                    )
                  ],
                ),
              ),
              TransparentButton(
                onPressed: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.support,
                      color: kEmeraldGreen,
                    ),
                    horizontalSpaceSmall,
                    Text(
                      'Support',
                      style: kBodyTextStyle,
                    )
                  ],
                ),
              ),
              if (model.user != null)
                TransparentButton(
                  onPressed: model.logout,
                  child: Row(
                    children: [
                      Icon(
                        Icons.logout,
                        color: kEmeraldGreen,
                      ),
                      horizontalSpaceSmall,
                      Text(
                        'Logout',
                        style: kBodyTextStyle,
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
      viewModelBuilder: () => ExpandedMenuViewModel(),
    );
  }
}
