import 'package:flutter/material.dart';
import 'package:rpl/ui/dumb_widgets/base_leaf_layout.dart';
import 'package:rpl/ui/dumb_widgets/floating_container.dart';
import 'package:rpl/ui/settings/settings_viewmodel.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';

class SettingsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SettingsViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: BaseLeafLayout(
          child: ListView(
            children: [
              verticalSpaceMedium,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingSmall),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(color: kEmeraldGreen, icon: Icon(Icons.arrow_back), onPressed: model.navigateToHome),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                child: Text("Settings", style: kTitleTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                child: Text("Quickly find the nearest recyclepoint", style: kSubtitleTextStyle),
              ),
              Padding(
                padding: const EdgeInsets.all(paddingRegular),
                child: FloatingContainer(
                  child: Container(
                    width: screenWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Appearance",
                          style: kHeadingTextStyle,
                        ),
                        Divider(),
                        verticalSpaceMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dark Mode",
                              style: kBodyTextStyle,
                            ),
                            Switch.adaptive(value: model.isDarkMode, onChanged: model.changeTheme)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Language",
                              style: kBodyTextStyle,
                            ),
                            DropdownButton(
                              hint: model.selectedLanguage == null ? Text('Dropdown', style: kSubtitleTextStyle) : Text(model.selectedLanguage!, style: kSubtitleTextStyle),
                              onChanged: (val) => model.changeLanguage(val.toString()),
                              items: [
                                DropdownMenuItem(
                                  value: 'NL',
                                  child: Text(
                                    'Nederlands',
                                    style: kSubtitleTextStyle,
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'EN',
                                  child: Text(
                                    'English',
                                    style: kSubtitleTextStyle,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        // body: CustomScrollView(
        //   slivers: [
        //     // SliverAppBar(
        //     //   expandedHeight: screenHeightPercentage(context, percentage: 0.3),
        //     //   centerTitle: true,
        //     //   backgroundColor: kPlatinum,
        //     //   title: Text(
        //     //     "Settings",
        //     //     style: kTitleTextStyle,
        //     //   ),
        //     // ),
        //     // SliverToBoxAdapter(
        //     //   child: BaseLeafLayout(child: Container()),
        //     // )
        //   ],
        // ),
      ),
      viewModelBuilder: () => SettingsViewModel(),
    );
  }
}
