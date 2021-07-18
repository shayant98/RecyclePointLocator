import 'package:flutter/material.dart';
import 'package:rpl/app/app.locator.dart';
import 'package:rpl/app/locale_keys.g.dart';
import 'package:rpl/enum/bottom_sheet_type.dart';
import 'package:rpl/ui/dumb_widgets/radius_slider.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:easy_localization/easy_localization.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.LightFloatingBox: (context, sheetRequest, completer) => _FloatingBoxBottomSheet(request: sheetRequest, completer: completer),
    BottomSheetType.DarkFloatingBox: (context, sheetRequest, completer) => _DarkFloatingBoxBottomSheet(request: sheetRequest, completer: completer),
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}

class _FloatingBoxBottomSheet extends StatefulWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  _FloatingBoxBottomSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  __FloatingBoxBottomSheetState createState() => __FloatingBoxBottomSheetState();
}

class __FloatingBoxBottomSheetState extends State<_FloatingBoxBottomSheet> {
  double radius = 25;

  @override
  void initState() {
    radius = widget.request.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        margin: EdgeInsets.all(paddingMedium),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: kPlatinum,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.radius_card_title,
              style: kTitleTextStyle,
            ).tr(),
            Text(
              LocaleKeys.radius_card_subtitle,
              style: kSubtitleTextStyle,
            ).tr(),
            verticalSpaceMedium,
            RadiusSlider(
              radius: radius,
              onChanged: (double value) {
                setState(() {
                  radius = value;
                });
              },
            ),
            verticalSpaceMedium,
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () => widget.completer(SheetResponse(data: radius)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                color: kEmeraldGreen,
                child: Text(
                  LocaleKeys.radius_card_button,
                  style: kButtonTextStyle,
                ).tr(),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}

class _DarkFloatingBoxBottomSheet extends StatefulWidget {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  _DarkFloatingBoxBottomSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  __DarkFloatingBoxBottomSheetState createState() => __DarkFloatingBoxBottomSheetState();
}

class __DarkFloatingBoxBottomSheetState extends State<_DarkFloatingBoxBottomSheet> {
  double radius = 25;

  @override
  void initState() {
    radius = widget.request.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Container(
        margin: EdgeInsets.all(paddingMedium),
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: kPhthaloGreen,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LocaleKeys.radius_card_title,
              style: kTitleTextStyle,
            ).tr(),
            Text(
              LocaleKeys.radius_card_subtitle,
              style: kSubtitleTextStyle,
            ).tr(),
            verticalSpaceMedium,
            RadiusSlider(
              radius: radius,
              onChanged: (double value) {
                setState(() {
                  radius = value;
                });
              },
            ),
            verticalSpaceMedium,
            Align(
              alignment: Alignment.centerRight,
              child: MaterialButton(
                onPressed: () => widget.completer(SheetResponse(data: radius)),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                color: kEmeraldGreen,
                child: Text(
                  LocaleKeys.radius_card_button,
                  style: kButtonTextStyle,
                ).tr(),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
