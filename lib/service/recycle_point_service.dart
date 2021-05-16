import 'package:rpl/models/application_models.dart';

class RecyclePointService {
  RecyclePoint? _recyclePoint;
  RecyclePoint? get recyclePoint => _recyclePoint;

  setRecyclePoint(RecyclePoint? recyclePoint) => _recyclePoint = recyclePoint;
}
