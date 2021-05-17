import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RecyclePointMap extends StatelessWidget {
  final CameraPosition initialCameraPosition;
  final Set<Marker> markers;
  final Set<Circle> radiusCircle;
  final Set<Polyline> polylines;
  final void Function(GoogleMapController) onMapCreated;

  const RecyclePointMap({
    Key? key,
    required this.initialCameraPosition,
    required this.onMapCreated,
    this.markers = const {},
    this.radiusCircle = const {},
    this.polylines = const {},
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: initialCameraPosition,
      markers: markers,
      circles: radiusCircle,
      polylines: polylines,
      mapToolbarEnabled: false,
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      mapType: MapType.normal,
      onMapCreated: onMapCreated,
    );
  }
}
