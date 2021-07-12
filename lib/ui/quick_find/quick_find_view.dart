import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rpl/app/locale_keys.g.dart';
import 'package:rpl/ui/dumb_widgets/floating_container.dart';
import 'package:rpl/ui/dumb_widgets/leaf_clipper.dart';
import 'package:rpl/ui/dumb_widgets/radius_slider.dart';
import 'package:rpl/ui/quick_find/quick_find_viewmodel.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:stacked_themes/stacked_themes.dart';

class QuickFindView extends StatelessWidget {
  const QuickFindView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuickFindViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            LeafClipper(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: Text(LocaleKeys.quick_find_title, style: kTitleTextStyle).tr(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: Text(LocaleKeys.quick_find_subtitle, style: kSubtitleTextStyle).tr(),
                ),
                verticalSpaceLarge,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: Text(
                    LocaleKeys.quick_find_materials_title,
                    style: kTitleTextStyle.copyWith(fontSize: 18),
                  ).tr(),
                ),
                verticalSpaceRegular,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => model.toggleSelect("glass"),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: model.selectedMaterials.contains("glass") ? kEmeraldGreen : kPlatinum,
                          foregroundColor: model.selectedMaterials.contains("glass") ? kPlatinum : kEmeraldGreen,
                          child: Icon(
                            FontAwesomeIcons.glassMartini,
                            size: 20,
                          ),
                        ),
                      ),
                      horizontalSpaceMedium,
                      GestureDetector(
                        onTap: () => model.toggleSelect("paper"),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: model.selectedMaterials.contains("paper") ? kEmeraldGreen : kPlatinum,
                          foregroundColor: model.selectedMaterials.contains("paper") ? kPlatinum : kEmeraldGreen,
                          child: Icon(
                            FontAwesomeIcons.box,
                            size: 20,
                          ),
                        ),
                      ),
                      horizontalSpaceMedium,
                      GestureDetector(
                        onTap: () => model.toggleSelect("plastic"),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: model.selectedMaterials.contains("plastic") ? kEmeraldGreen : kPlatinum,
                          foregroundColor: model.selectedMaterials.contains("plastic") ? kPlatinum : kEmeraldGreen,
                          child: Icon(
                            FontAwesomeIcons.shoppingBag,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpaceLarge,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: Text(
                    LocaleKeys.quick_find_radius,
                    style: kTitleTextStyle.copyWith(fontSize: 18),
                  ).tr(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: RadiusSlider(radius: model.radius, onChanged: model.setRadius),
                ),
                Spacer(),
                FloatingContainer(
                  child: Container(
                    width: screenWidth(context),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.quick_find_summary,
                          style: kTitleTextStyle,
                        ).tr(),
                        for (var material in model.selectedMaterials)
                          Row(
                            children: [
                              Container(
                                height: 5.0,
                                width: 5.0,
                                decoration: new BoxDecoration(
                                  color: getThemeManager(context).isDarkMode ? kPlatinum : kDarkJungleGreen,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              horizontalSpaceTiny,
                              Text(
                                material,
                                style: kBodyTextStyle,
                              )
                            ],
                          ),
                        verticalSpaceMedium,
                        Text(
                          LocaleKeys.quick_find_radius_to_search,
                          style: kBodyTextStyle.copyWith(fontWeight: FontWeight.bold),
                        ).tr(args: [model.radius.toString()])
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "quickFind",
          onPressed: model.onTap,
          child: model.isBusy
              ? CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(kPlatinum),
                )
              : Icon(
                  FontAwesomeIcons.search,
                  size: 16,
                ),
        ),
      ),
      viewModelBuilder: () => QuickFindViewModel(),
    );
  }
}
