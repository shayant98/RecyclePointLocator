import 'package:rpl/api/firestore_api.dart';
import 'package:rpl/app/app.locator.dart';
import 'package:rpl/models/application_models.dart';
import 'package:rpl/service/location_service.dart';

class RecyclePointService {
  final LocationService _locationService = locator<LocationService>();
  final FirestoreApi _firestoreApi = locator<FirestoreApi>();

  RecyclePoint? _recyclePoint;
  RecyclePoint? get recyclePoint => _recyclePoint;

  setRecyclePoint(RecyclePoint? recyclePoint) => _recyclePoint = recyclePoint;
}
