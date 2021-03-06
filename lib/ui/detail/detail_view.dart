import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rpl/app/locale_keys.g.dart';
import 'package:rpl/enum/material_type.dart';
import 'package:rpl/ui/detail/detail_viewmodel.dart';
import 'package:rpl/ui/dumb_widgets/Recycle_point_map.dart';
import 'package:rpl/ui/dumb_widgets/floating_container.dart';
import 'package:rpl/ui/dumb_widgets/leaf_clipper.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';
import 'package:easy_localization/easy_localization.dart';

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
                          model.recyclePoint!.id.toString(),
                          style: kBody2TextStyle.copyWith(color: kShadow),
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
                  child: Text(LocaleKeys.details_materials_title, style: kHeadingTextStyle).tr(),
                ),
                verticalSpaceRegular,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: _AllowedMaterials(),
                ),
                verticalSpaceTiny,
              ],
            ),
            DetailHeader(),
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

class DetailHeader extends ViewModelWidget<DetailViewModel> {
  const DetailHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, DetailViewModel model) {
    return Positioned(
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
              icon: model.isFavourite ? Icon(Icons.favorite_rounded) : Icon(Icons.favorite_outline_rounded),
              onPressed: model.toggleFavourite,
            ),
          ],
        ),
      ),
    );
  }
}

class _AllowedMaterials extends ViewModelWidget<DetailViewModel> {
  const _AllowedMaterials({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, DetailViewModel model) {
    return FloatingContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (model.recyclePoint!.materials.contains("glass"))
            GestureDetector(
              onTap: () => model.materialOnTap(RecycleMaterialType.glass),
              child: Column(
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
                    LocaleKeys.material_glass,
                    style: kBodyTextStyle,
                  ).tr()
                ],
              ),
            ),
          if (model.recyclePoint!.materials.contains("paper"))
            GestureDetector(
              onTap: () => model.materialOnTap(RecycleMaterialType.paper),
              child: Column(
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
                    LocaleKeys.material_paper,
                    style: kBodyTextStyle,
                  ).tr()
                ],
              ),
            ),
          if (model.recyclePoint!.materials.contains("plastic"))
            GestureDetector(
              onTap: () => model.materialOnTap(RecycleMaterialType.plastic),
              child: Column(
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
                    LocaleKeys.material_plastic,
                    style: kBodyTextStyle,
                  ).tr()
                ],
              ),
            ),
        ],
      ),
    );
  }
}
