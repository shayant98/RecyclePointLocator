import 'package:rpl/app/app.locator.dart';
import 'package:rpl/enum/snackbar_type.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:stacked_services/stacked_services.dart';

void setupSnackbarUi() {
  final service = locator<SnackbarService>();

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.darkMode,
    config: SnackbarConfig(
      backgroundColor: kPlatinum,
      textColor: kPhthaloGreen,
    ),
  );

  service.registerCustomSnackbarConfig(
    variant: SnackbarType.lightMode,
    config: SnackbarConfig(
      backgroundColor: kDarkJungleGreen,
      textColor: kPlatinum,
    ),
  );
}
