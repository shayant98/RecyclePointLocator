import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rpl/app/locale_keys.g.dart';
import 'package:rpl/ui/dumb_widgets/base_leaf_layout.dart';
import 'package:rpl/ui/dumb_widgets/floating_container.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:rpl/ui/support/support_viewmodel.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';

class SupportView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SupportViewModel>.reactive(
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
                child: Text(LocaleKeys.about_us_title, style: kTitleTextStyle).tr(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                child: Text(LocaleKeys.about_us_subtitle, style: kSubtitleTextStyle).tr(),
              ),
              Padding(
                padding: EdgeInsets.all(paddingRegular),
                child: FloatingContainer(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.about_us_about_us_card_title,
                      style: kHeadingTextStyle,
                    ).tr(),
                    Divider(),
                    verticalSpaceSmall,
                    Text(
                        "SuReSur is in 2015 opgericht. We zijn in april 2015 na de voorbereidingsfase met het project gestart. Stichting wil graag een voortrekkers rol vervullen in het bewustmaken van de Surinaamse bevoking op het gebied van recyclen. Dit wil ze doen door onder andere landelijk in totaal 450 verzamelbakken op strategische plekken plaatsen waar de plastic flessen en aluminium blikken worden ingezameld. Het is de bedoeling dat deze ingezamelde flessen en blikken worden afgevoerd naar een recyclebedrijf.")
                  ],
                )),
              ),
              Padding(
                padding: EdgeInsets.all(paddingRegular),
                child: FloatingContainer(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.about_us_contact_card_title,
                      style: kHeadingTextStyle,
                    ).tr(),
                    Divider(),
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "+(597) 711-3929",
                          style: kBodyTextStyle,
                        ),
                        IconButton(onPressed: model.navigateToPhone, icon: Icon(FontAwesomeIcons.phoneAlt))
                      ],
                    ),
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "www.suresur.green",
                          style: kBodyTextStyle,
                        ),
                        IconButton(onPressed: model.navigateToWebsite, icon: Icon(FontAwesomeIcons.globe))
                      ],
                    )
                  ],
                )),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "quickFind",
          onPressed: model.navigateToGoogleMaps,
          child: Icon(FontAwesomeIcons.map),
        ),
      ),
      viewModelBuilder: () => SupportViewModel(),
    );
  }
}
