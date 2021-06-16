import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RecyclePointMap extends StatefulWidget {
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
  _RecyclePointMapState createState() => _RecyclePointMapState();
}

class _RecyclePointMapState extends State<RecyclePointMap> {
  BitmapDescriptor? _customIcon;

  @override
  void initState() {
    createMarker();
    super.initState();
  }

  void createMarker() {
    BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/marker.png',
    ).then((value) => _customIcon = value);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: widget.initialCameraPosition,
      markers: widget.markers.map((Marker marker) => marker.copyWith(iconParam: _customIcon)).toSet(),
      circles: widget.radiusCircle,
      polylines: widget.polylines,
      mapToolbarEnabled: false,
      zoomControlsEnabled: false,
      myLocationEnabled: true,
      myLocationButtonEnabled: false,
      mapType: MapType.normal,
      onMapCreated: widget.onMapCreated,
    );
  }
}
