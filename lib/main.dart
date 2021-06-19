import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.router.dart';
import 'package:rpl/ui/shared/setup_bottom_sheet_ui.dart';
import 'package:rpl/ui/shared/setup_snackbar_ui.dart';
import 'package:rpl/ui/shared/themes.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.initialise();
  await Firebase.initializeApp();
  await setupLocator();
  setupBottomSheetUi();
  setupSnackbarUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ThemeBuilder(
      statusBarColorBuilder: (theme) => theme!.scaffoldBackgroundColor,
      defaultThemeMode: ThemeMode.system,
      darkTheme: AppThemes.darkTheme,
      lightTheme: AppThemes.lightTheme,
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        title: 'RPL',
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        navigatorKey: StackedService.navigatorKey,
        onGenerateRoute: StackedRouter().onGenerateRoute,
      ),
    );
  }
}
