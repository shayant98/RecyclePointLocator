import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rpl/ui/dumb_widgets/Recycle_point_map.dart';
import 'package:rpl/ui/dumb_widgets/floating_container.dart';
import 'package:rpl/ui/dumb_widgets/recycle_point_tile.dart';
import 'package:rpl/ui/navigation/navigation_viewmodel.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class NavigationView extends StatelessWidget {
  const NavigationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<NavigationViewModel>.reactive(
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: kEmeraldGreen),
          elevation: 0,
        ),
        body: Stack(
          children: [
            RecyclePointMap(
              markers: model.markers,
              initialCameraPosition: CameraPosition(
                target: LatLng(model.userPosition!.latitude!, model.userPosition!.longitude!),
                zoom: 15,
              ),
              polylines: {
                if (model.info != null)
                  Polyline(
                    polylineId: PolylineId('routeInfo'),
                    color: kEmeraldGreen,
                    width: 5,
                    points: model.info!.polylinePoints.map((e) {
                      return LatLng(e.latitude, e.longitude);
                    }).toList(),
                  )
              },
              onMapCreated: model.onMapCreated,
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: paddingSmall, vertical: paddingRegular),
            //   child: IconButton(color: kEmeraldGreen, icon: Icon(Icons.arrow_back), onPressed: model.navigateToHome),
            // ),
            AnimatedAlign(
              alignment: model.showRecyclePoint ? Alignment.bottomCenter : Alignment(0, 40),
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 500),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingRegular, vertical: paddingRegular),
                child: Wrap(children: [
                  GestureDetector(
                    // onTapv  : (DragDownDetails dragDownDetails) => model.toggleShowRecyclePoint(),
                    child: FloatingContainer(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recyclepoint Selected',
                          style: kTitleTextStyle,
                        ),
                        Divider(),
                        verticalSpaceRegular,
                        RecyclePointTile(
                          recyclePoint: model.recyclePoint!,
                          showFavouriteIcon: false,
                        ),
                      ],
                    )),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => NavigationViewModel(),
    );
  }
}
