import 'package:rpl/app/app.locator.dart';
import 'package:rpl/enum/material_type.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class QuickFindViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  Set<RecycleMaterialType> _selectedMaterials = {};
  Set<RecycleMaterialType> get selectedMaterials => _selectedMaterials;

  void navigateToHome() {
    _navigationService.back();
  }

  toggleSelect(RecycleMaterialType type) {
    if (_selectedMaterials.contains(type)) {
      _selectedMaterials.remove(type);
    } else {
      _selectedMaterials.add(type);
    }
    notifyListeners();
  }
}
