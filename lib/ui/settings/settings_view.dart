import 'package:flutter/material.dart';
import 'package:rpl/app/locale_keys.g.dart';
import 'package:rpl/ui/dumb_widgets/base_leaf_layout.dart';
import 'package:rpl/ui/dumb_widgets/floating_container.dart';
import 'package:rpl/ui/settings/settings_viewmodel.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';

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
                child: Text(LocaleKeys.settings_title, style: kTitleTextStyle).tr(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                child: Text(LocaleKeys.settings_subtitle, style: kSubtitleTextStyle).tr(),
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
                          LocaleKeys.settings_appearance_card_title,
                          style: kHeadingTextStyle,
                        ).tr(),
                        Divider(),
                        verticalSpaceMedium,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.settings_dark_mode,
                              style: kBodyTextStyle,
                            ).tr(),
                            Switch.adaptive(value: model.isDarkMode, onChanged: model.changeTheme)
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              LocaleKeys.language_dark_mode,
                              style: kBodyTextStyle,
                            ).tr(),
                            DropdownButton(
                              hint: Text(context.locale.languageCode.toString().toUpperCase()),
                              onChanged: (Locale? locale) => context.setLocale(locale!),
                              items: context.supportedLocales
                                  .map(
                                    (locale) => DropdownMenuItem(
                                      value: locale,
                                      child: Text(
                                        "${locale.toString() == 'nl' ? '🇳🇱' : locale.toString() == 'en' ? "🇬🇧" : locale.toString() == 'pt' ? "🇧🇷" : ""} -  ${locale.languageCode.toUpperCase()}",
                                        style: kSubtitleTextStyle,
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
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
      ),
      viewModelBuilder: () => SettingsViewModel(),
    );
  }
}
