import 'package:flutter/material.dart';
import 'package:rpl/app/locale_keys.g.dart';
import 'package:rpl/ui/dumb_widgets/floating_container.dart';
import 'package:rpl/ui/dumb_widgets/transparent_button.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:rpl/ui/smart_widgets/expanded_menu/expanded_menu_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';

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
                        LocaleKeys.expanded_menu_login,
                        style: kBodyTextStyle,
                      ).tr()
                  ],
                ),
              ),
              Divider(),
              TransparentButton(
                onPressed: model.navigatoToSettings,
                child: Row(
                  children: [
                    Icon(
                      Icons.settings,
                      color: kEmeraldGreen,
                    ),
                    horizontalSpaceSmall,
                    Text(
                      LocaleKeys.expanded_menu_settings,
                      style: kBodyTextStyle,
                    ).tr()
                  ],
                ),
              ),
              TransparentButton(
                onPressed: model.navigatoToSupport,
                child: Row(
                  children: [
                    Icon(
                      Icons.support,
                      color: kEmeraldGreen,
                    ),
                    horizontalSpaceSmall,
                    Text(
                      LocaleKeys.expanded_menu_about_us,
                      style: kBodyTextStyle,
                    ).tr()
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
                        LocaleKeys.expanded_menu_logout,
                        style: kBodyTextStyle,
                      ).tr()
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
