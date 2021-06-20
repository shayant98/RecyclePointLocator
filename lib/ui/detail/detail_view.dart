import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rpl/ui/detail/detail_viewmodel.dart';
import 'package:rpl/ui/dumb_widgets/Recycle_point_map.dart';
import 'package:rpl/ui/dumb_widgets/floating_container.dart';
import 'package:rpl/ui/dumb_widgets/leaf_clipper.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<DetailViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            LeafClipper(),
            ListView(
              children: [
                Container(
                  width: screenWidthPercentage(context),
                  height: screenHeightPercentage(context, percentage: 0.4),
                  child: RecyclePointMap(
                    onMapCreated: model.onMapCreated,
                    initialCameraPosition: CameraPosition(
                      target: LatLng(model.recyclePointCoordinates!.latitude, model.recyclePointCoordinates!.longitude),
                      zoom: 15,
                    ),
                    markers: model.markers,
                  ),
                ),
                verticalSpaceRegular,
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: paddingRegular, right: paddingTiny),
                      child: Text(model.recyclePoint!.name, style: kTitleTextStyle),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "#1234",
                          style: kBodyTextStyle.copyWith(color: kShadow),
                        ),
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: Text(model.recyclePoint!.adres, style: kSubtitleTextStyle),
                ),
                verticalSpaceLarge,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: Text("Materials you can recycle", style: kHeadingTextStyle),
                ),
                verticalSpaceRegular,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: _AllowedMaterials(),
                ),
                verticalSpaceLarge,
              ],
            ),
            Positioned(
              top: paddingRegular,
              left: paddingSmall,
              right: paddingSmall,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      color: kEmeraldGreen,
                      icon: Icon(Icons.arrow_back),
                      onPressed: model.navigateToHome,
                    ),
                    IconButton(
                      color: kEmeraldGreen,
                      icon: Icon(Icons.favorite_rounded),
                      onPressed: model.navigateToHome,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "quickFind",
          onPressed: model.navigateToNavigation,
          child: Icon(
            FontAwesomeIcons.locationArrow,
            size: 16,
          ),
        ),
      ),
      viewModelBuilder: () => DetailViewModel(),
    );
  }
}

class _AllowedMaterials extends StatelessWidget {
  const _AllowedMaterials({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: kEmeraldGreen,
                foregroundColor: kPlatinum,
                child: Icon(
                  FontAwesomeIcons.glassMartini,
                  size: 20,
                ),
              ),
              Text(
                "Glass",
                style: kBodyTextStyle,
              )
            ],
          ),
          VerticalDivider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: kEmeraldGreen,
                foregroundColor: kPlatinum,
                child: Icon(
                  FontAwesomeIcons.box,
                  size: 20,
                ),
              ),
              Text(
                "Paper",
                style: kBodyTextStyle,
              )
            ],
          ),
          VerticalDivider(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 22,
                backgroundColor: kEmeraldGreen,
                foregroundColor: kPlatinum,
                child: Icon(
                  FontAwesomeIcons.shoppingBag,
                  size: 20,
                ),
              ),
              Text(
                "Plastic",
                style: kBodyTextStyle,
              )
            ],
          ),
        ],
      ),
    );
  }
}
