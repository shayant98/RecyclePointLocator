import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:rpl/ui/home/home_viewmodel.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  GoogleMapController? mapController;
  Location location = new Location();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        body: Stack(
          children: [
            GoogleMap(
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              zoomControlsEnabled: false,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              onMapCreated: _onMapCreated,
            ),
            Positioned(
              top: paddingRegular,
              right: paddingRegular,
              child: IconButton(
                onPressed: () {
                  print(1234);
                },
                splashColor: Colors.red,
                iconSize: 32,
                color: kEmeraldGreen,
                icon: Icon(Icons.account_circle_outlined),
              ),
            ),
            buildLocationsSheet(),
            Positioned(
              bottom: paddingRegular,
              right: paddingRegular,
              child: FloatingActionButton.extended(
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
                onPressed: () {},
              ),
            ),
            Positioned(
              top: 120,
              left: paddingRegular,
              child: FloatingActionButton(
                child: Text(
                  "25km",
                  style: kBodyTextStyle.copyWith(
                      fontWeight: FontWeight.bold, color: kEmeraldGreen),
                ),
                foregroundColor: kPlatinum,
                backgroundColor: kPlatinum,
                onPressed: () {},
              ),
            ),
            Positioned(
              top: paddingMedium,
              left: paddingRegular,
              child: FloatingActionButton(
                child: Icon(
                  Icons.location_on,
                  color: kEmeraldGreen,
                  size: 24,
                ),
                foregroundColor: kPlatinum,
                backgroundColor: kPlatinum,
                onPressed: _animateToUser,
              ),
            ),
          ],
        ),
      ),
      viewModelBuilder: () => HomeViewModel(),
    );
  }

  DraggableScrollableSheet buildLocationsSheet() {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      maxChildSize: 0.6,
      minChildSize: 0.3,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
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
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: paddingRegular,
                    left: paddingRegular,
                  ),
                  child: Text(
                    'Places near you',
                    style: kTitleTextStyle,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: paddingRegular,
                  ),
                  child: Text(
                    'The following locations have been found',
                    style: kSubtitleTextStyle,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    controller: scrollController,
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: paddingRegular),
                        child: ListTile(
                          title: Text('Item $index'),
                        ),
                      );
                    },
                  ),
                )
              ],
            ));
      },
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  _animateToUser() async {
    var pos = await location.getLocation();
    mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(pos.latitude!, pos.longitude!), zoom: 15)));
  }
}
