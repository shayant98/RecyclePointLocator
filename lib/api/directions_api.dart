import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rpl/app/app.logger.dart';
import 'package:rpl/models/directions_model.dart';
import 'package:rpl/ui/shared/env.dart';

class DirectionsApi {
  final log = getLogger('DirectionsApi');

  static const String _GOOGLE_MAPS_URL = 'https://maps.googleapis.com/maps/api/directions/json?';
  final Dio _dio = Dio();

  Future<Directions?> getDirections({required LatLng origin, required LatLng destination}) async {
    final response = await _dio.get(
      _GOOGLE_MAPS_URL,
      queryParameters: {
        'origin': '${origin.latitude},${origin.longitude}',
        'destination': '${destination.latitude},${destination.longitude}',
        'key': googleAPIKey,
      },
    );

    // Check if response is successful
    if (response.statusCode == 200) {
      log.i('Response Data: ${response.data}');
      return Directions.fromJson(response.data);
    }
    return null;
  }
}
