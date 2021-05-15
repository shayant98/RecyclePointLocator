import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rpl/ui/home/home_viewmodel.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            SizedBox(
              width: screenWidth(context),
              height: screenHeight(context),
              child: GoogleMap(
                mapType: MapType.normal,
                markers: model.markers,
                initialCameraPosition: CameraPosition(
                  target: LatLng(model.pos!.latitude!, model.pos!.longitude!),
                  zoom: 15,
                ),
                zoomControlsEnabled: false,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                scrollGesturesEnabled: false,
                rotateGesturesEnabled: false,
                onMapCreated: model.onMapCreated,
              ),
            ),
            Positioned(
              top: 40,
              right: paddingRegular,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: model.showExpandedMenuOrLogin,
                    iconSize: 32,
                    color: kEmeraldGreen,
                    icon: Icon(Icons.account_circle_outlined),
                  ),
                  if (model.showMenu) _BuildExpandedMenu()
                ],
              ),
            ),
            _LocationSheetWidget(),
            Positioned(
              bottom: paddingRegular,
              right: paddingRegular,
              child: FloatingActionButton.extended(
                heroTag: "quickFind",
                label: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(
                      Icons.search,
                      color: kPlatinum,
                      size: 14,
                    ),
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
            Positioned(
              top: 120,
              left: paddingRegular,
              child: FloatingActionButton(
                heroTag: "radius",
                child: Text(
                  '${model.radius.toInt()}km',
                  style: kBodyTextStyle.copyWith(
                      fontWeight: FontWeight.bold,
                      color: kEmeraldGreen,
                      fontSize: 12),
                ),
                foregroundColor: kPlatinum,
                backgroundColor: kPlatinum,
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
                foregroundColor: kPlatinum,
                backgroundColor: kPlatinum,
                onPressed: model.animateToUser,
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }
}

class _BuildExpandedMenu extends ViewModelWidget<HomeViewModel> {
  const _BuildExpandedMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, HomeViewModel model) {
    return Container(
      width: screenWidthPercentage(context, percentage: 0.3),
      height: screenHeightPercentage(context, percentage: 0.3),
      decoration: BoxDecoration(
        color: kPlatinum,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            offset: Offset(0, 4),
            color: kShadow.withOpacity(0.5),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          MaterialButton(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: paddingRegular),
            onPressed: model.navigatoToProfile,
            child: Row(
              children: [
                Icon(
                  Icons.account_circle_outlined,
                  size: 32,
                  color: kEmeraldGreen,
                ),
                horizontalSpaceSmall,
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
              ],
            ),
          ),
          Divider(
            color: kShadow,
          ),
          MaterialButton(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: paddingRegular),
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
          MaterialButton(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: paddingRegular),
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
          MaterialButton(
            padding: EdgeInsets.only(top: 10, bottom: 10, left: paddingRegular),
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
          Divider(
            color: kShadow,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Privacy Policy',
                style: kBody2TextStyle,
              ),
              horizontalSpaceSmall,
              Text(
                'Who are we?',
                style: kBody2TextStyle,
              )
            ],
          )
        ],
      ),
    );
  }
}

class _LocationSheetWidget extends ViewModelWidget<HomeViewModel> {
  @override
  Widget build(BuildContext context, HomeViewModel model) =>
      DraggableScrollableSheet(
        initialChildSize: 0.3,
        maxChildSize: 0.6,
        minChildSize: 0.2,
        builder: (BuildContext context, ScrollController scrollController) =>
            Container(
          decoration: BoxDecoration(
              color: kPlatinum,
              boxShadow: [
                BoxShadow(
                  color: kShadow.withOpacity(0.5), //color of shadow
                  spreadRadius: 5, //spread radius
                  blurRadius: 10, // blur radius
                  offset: Offset(0, 4), // changes position of shadow
                ),
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25), topRight: Radius.circular(25))),
          child: model.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: paddingRegular,
                        left: paddingRegular,
                      ),
                      child: Text(
                        model.isBusy || !model.isRecyclePointDataReady
                            ? 'Loading points near you'
                            : model.recyclePointData.length > 0
                                ? 'Points near you'
                                : 'No Points found near you',
                        style: kTitleTextStyle,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: paddingRegular,
                      ),
                      child: Text(
                        model.isBusy || !model.isRecyclePointDataReady
                            ? 'Please wait while we load the closest recyclepoints'
                            : model.recyclePointData.length > 0
                                ? 'The following points are closest to you'
                                : 'we were unable to identify recyclepoints',
                        style: kSubtitleTextStyle,
                      ),
                    ),
                    Expanded(
                        child: model.isBusy || !model.isRecyclePointDataReady
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : model.recyclePointData.length > 0
                                ? ListView.builder(
                                    controller: scrollController,
                                    itemCount:
                                        model.dataMap!['recycle-stream'].length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: paddingRegular),
                                        child: ListTile(
                                          title: Text(
                                              '${model.recyclePointData[index].name}'),
                                        ),
                                      );
                                    },
                                  )
                                : Container())
                  ],
                ),
        ),
      );
}
