import 'package:rpl/ui/detail/detail_view.dart';
import 'package:rpl/ui/home/home_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: HomeView, initial: true),
  MaterialRoute(page: DetailView),
], dependencies: [
  LazySingleton(classType: NavigationService)
])
class AppSetup {}
