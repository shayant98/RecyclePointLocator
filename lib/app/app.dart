import 'package:rpl/api/directions_api.dart';
import 'package:rpl/api/firestore_api.dart';
import 'package:rpl/service/auth_service.dart';
import 'package:rpl/service/location_service.dart';
import 'package:rpl/service/recycle_point_service.dart';
import 'package:rpl/service/user_service.dart';
import 'package:rpl/ui/detail/detail_view.dart';
import 'package:rpl/ui/home/home_view.dart';
import 'package:rpl/ui/login/login_view.dart';
import 'package:rpl/ui/navigation/navigation_view.dart';
import 'package:rpl/ui/profile/profile_view.dart';
import 'package:rpl/ui/quick_find/quick_find_view.dart';
import 'package:rpl/ui/register/register_view.dart';
import 'package:rpl/ui/settings/settings_view.dart';
import 'package:rpl/ui/startup/startup_view.dart';
import 'package:rpl/ui/support/support_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_firebase_auth/stacked_firebase_auth.dart';
import 'package:stacked_services/stacked_services.dart';

@StackedApp(routes: [
  MaterialRoute(page: StartupView, initial: true),
  CupertinoRoute(page: HomeView),
  CupertinoRoute(page: SettingsView),
  CupertinoRoute(page: SupportView),
  CupertinoRoute(page: DetailView),
  CupertinoRoute(page: ProfileView),
  CupertinoRoute(page: LoginView),
  CupertinoRoute(page: RegisterView),
  CupertinoRoute(page: NavigationView),
  CupertinoRoute(page: QuickFindView, fullscreenDialog: true),
], dependencies: [
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: SnackbarService),
  LazySingleton(classType: FirestoreApi),
  LazySingleton(classType: DirectionsApi),
  LazySingleton(classType: UserService),
  LazySingleton(classType: AuthService),
  LazySingleton(classType: LocationService),
  LazySingleton(classType: RecyclePointService),
  Singleton(classType: FirebaseAuthenticationService)
], logger: StackedLogger())
class AppSetup {}
