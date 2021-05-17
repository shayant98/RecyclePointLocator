import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/app.router.dart';
import 'package:rpl/ui/shared/setup_bottom_sheet_ui.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  setupBottomSheetUi();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      title: 'RPL',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: kEmeraldGreen,
        accentColor: kEmeraldGreen,
        splashColor: kEmeraldGreen,
        scaffoldBackgroundColor: kPlatinum,
        shadowColor: kShadow.withOpacity(0.5),
      ),
      navigatorKey: StackedService.navigatorKey,
      onGenerateRoute: StackedRouter().onGenerateRoute,
    );
  }
}
