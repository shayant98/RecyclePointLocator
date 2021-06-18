import 'package:rpl/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class QuickFindViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  Set<String> _selectedMaterials = {};
  Set<String> get selectedMaterials => _selectedMaterials;

  double radius = 5;

  void navigateToHome() {
    _navigationService.back();
  }

  toggleSelect(String type) {
    if (_selectedMaterials.contains(type)) {
      _selectedMaterials.remove(type);
    } else {
      _selectedMaterials.add(type);
    }
    notifyListeners();
  }

  void setRadius(double value) {
    radius = value;
    notifyListeners();
  }
}
