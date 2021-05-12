import 'package:rpl/ui/detail/detail_view.dart';
import 'package:rpl/ui/home/home_view.dart';
import 'package:rpl/ui/login/login_view.dart';
import 'package:rpl/ui/register/register_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: HomeView, initial: true),
  MaterialRoute(page: DetailView),
  MaterialRoute(page: LoginView),
  MaterialRoute(page: RegisterView),
], dependencies: [
  LazySingleton(classType: NavigationService),
  Singleton(classType: FirebaseAuthenticationService)
])
class AppSetup {}
