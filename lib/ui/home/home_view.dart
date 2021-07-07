import 'package:flutter/material.dart' hide Overlay;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rpl/app/locale_keys.g.dart';
import 'package:rpl/ui/dumb_widgets/Recycle_point_map.dart';
import 'package:rpl/ui/dumb_widgets/overlay.dart';
import 'package:rpl/ui/dumb_widgets/recycle_point_tile.dart';
import 'package:rpl/ui/home/home_viewmodel.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:rpl/ui/smart_widgets/expanded_menu/expanded_menu_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:easy_localization/easy_localization.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => WillPopScope(
        onWillPop: () async {
          if (model.showMenu) {
            model.toggleExpandedMenu();
            return false;
          } else {
            return true;
          }
        },
        child: Scaffold(
          body: Stack(
            children: [
              SizedBox(
                width: screenWidth(context),
                height: screenHeight(context),
                child: RecyclePointMap(
                  markers: model.markers,
                  radiusCircle: model.radiusCirlce,
                  initialCameraPosition: CameraPosition(
                    target: LatLng(model.pos!.latitude!, model.pos!.longitude!),
                    zoom: model.zoomLevels[model.radius] ?? 12,
                  ),
                  onMapCreated: model.onMapCreated,
                ),
              ),
              Positioned(
                top: 40,
                right: paddingRegular,
                child: IconButton(
                  onPressed: model.toggleExpandedMenu,
                  iconSize: 32,
                  color: getThemeManager(context).isDarkMode ? kPhthaloGreen : kEmeraldGreen,
                  icon: Icon(
                    Icons.account_circle,
                  ),
                ),
              ),
              _LocationSheetWidget(),
              Positioned(
                top: 120,
                left: paddingRegular,
                child: FloatingActionButton(
                  heroTag: "radius",
                  child: Text(
                    '${model.radius.toInt()}KM',
                    style: kBodyTextStyle.copyWith(fontWeight: FontWeight.bold, color: kEmeraldGreen, fontSize: 12),
                  ),
                  backgroundColor: getThemeManager(context).isDarkMode ? kPhthaloGreen : kPlatinum,
                  onPressed: model.showRadiusSlider,
                ),
              ),
              Positioned(
                top: paddingMedium,
                left: paddingRegular,
                child: FloatingActionButton(
                  heroTag: "userLoc",
                  child: Icon(
                    Icons.location_on,
                    color: kEmeraldGreen,
                    size: 24,
                  ),
                  backgroundColor: getThemeManager(context).isDarkMode ? kPhthaloGreen : kPlatinum,
                  onPressed: model.animateToUser,
                ),
              ),
              model.showMenu ? Overlay(onTap: model.toggleExpandedMenu) : Container(),
              AnimatedPositioned(
                top: 90,
                curve: Curves.easeInOut,
                right: model.showMenu ? paddingRegular : -300,
                duration: Duration(milliseconds: 200),
                child: ExpandedMenuView(),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton.extended(
            heroTag: "quickFind",
            label: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  FontAwesomeIcons.search,
                  color: kPlatinum,
                  size: 14,
                ),
                horizontalSpaceTiny,
                Text(
                  'QUICK FIND',
                  style: kButtonTextStyle,
                ),
              ],
            ),
            foregroundColor: kEmeraldGreen,
            backgroundColor: kEmeraldGreen,
            onPressed: model.navigatoToQuickFind,
          ),
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class _LocationSheetWidget extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) => DraggableScrollableSheet(
        initialChildSize: 0.3,
        maxChildSize: 0.6,
        minChildSize: 0.2,
        builder: (BuildContext context, ScrollController scrollController) => Container(
          padding: const EdgeInsets.symmetric(vertical: paddingRegular, horizontal: paddingRegular),
          decoration: BoxDecoration(
              color: getThemeManager(context).isDarkMode ? kPhthaloGreen : kPlatinum,
              boxShadow: [
                getThemeManager(context).isDarkMode
                    ? BoxShadow()
                    : BoxShadow(
                        color: kShadow.withOpacity(0.5), //color of shadow
                        spreadRadius: 5, //spread radius
                        blurRadius: 10, // blur radius
                        offset: Offset(0, 4), // changes position of shadow
                      ),
              ],
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: model.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        AnimatedOpacity(
                          opacity: model.isBusy || !model.isRecyclePointDataReady ? 1 : 0,
                          duration: Duration(milliseconds: 200),
                          child: Text(
                            LocaleKeys.rp_card_title_loading,
                            style: kTitleTextStyle,
                          ).tr(),
                        ),
                        AnimatedOpacity(
                          opacity: model.isRecyclePointDataReady && model.recyclePointData.length > 0 ? 1 : 0,
                          duration: Duration(milliseconds: 200),
                          child: Text(
                            LocaleKeys.rp_card_title,
                            style: kTitleTextStyle,
                          ).tr(),
                        ),
                        AnimatedOpacity(
                          opacity: model.isRecyclePointDataReady && model.recyclePointData.length < 1 ? 1 : 0,
                          duration: Duration(milliseconds: 200),
                          child: Text(
                            LocaleKeys.rp_card_title_empty,
                            style: kTitleTextStyle,
                          ).tr(),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        AnimatedOpacity(
                          opacity: model.isBusy || !model.isRecyclePointDataReady ? 1 : 0,
                          duration: Duration(milliseconds: 200),
                          child: Text(
                            LocaleKeys.rp_card_subtitle_loading,
                            style: kSubtitleTextStyle,
                          ).tr(),
                        ),
                        AnimatedOpacity(
                          opacity: model.isRecyclePointDataReady && model.recyclePointData.length > 0 ? 1 : 0,
                          duration: Duration(milliseconds: 200),
                          child: Text(
                            LocaleKeys.rp_card_subtitle,
                            style: kSubtitleTextStyle,
                          ).tr(),
                        ),
                        AnimatedOpacity(
                          opacity: model.isRecyclePointDataReady && model.recyclePointData.length < 1 ? 1 : 0,
                          duration: Duration(milliseconds: 200),
                          child: Text(
                            LocaleKeys.rp_card_subtitle_empty,
                            style: kSubtitleTextStyle,
                          ).tr(),
                        ),
                      ],
                    ),
                    Expanded(
                        child: model.isBusy || !model.isRecyclePointDataReady
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : model.recyclePointData.length > 0
                                ? ListView.separated(
                                    controller: scrollController,
                                    itemCount: model.dataMap!['recycle-stream'].length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return RecyclePointTile(
                                        onTap: () => model.navigateToDetail(model.recyclePointData[index]),
                                        recyclePoint: model.recyclePointData[index],
                                        showFavouriteIcon: false,
                                      );
                                    },
                                    separatorBuilder: (BuildContext context, int index) => verticalSpaceMedium)
                                : Container())
                  ],
                ),
        ),
      );
}
