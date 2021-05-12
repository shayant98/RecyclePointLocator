import 'package:flutter/material.dart';
import 'package:rpl/app/app.locator.dart';
import 'package:rpl/enum/bottom_sheet_type.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:stacked_services/stacked_services.dart';

void setupBottomSheetUi() {
  final bottomSheetService = locator<BottomSheetService>();

  final builders = {
    BottomSheetType.FloatingBox: (context, sheetRequest, completer) =>
        _FloatingBoxBottomSheet(request: sheetRequest, completer: completer)
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
  __FloatingBoxBottomSheetState createState() =>
      __FloatingBoxBottomSheetState();
}

class __FloatingBoxBottomSheetState extends State<_FloatingBoxBottomSheet> {
  double radius = 25;

  @override
  void initState() {
    radius = widget.request.customData;
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
              'Change search radius',
              style: kTitleTextStyle,
            ),
            Text(
              'Change the radius for more recycle locations',
              style: kSubtitleTextStyle,
            ),
            verticalSpaceMedium,
            Slider(
              min: 25.0,
              max: 100.0,
              divisions: 3,
              value: radius,
              label: 'Radius of ${radius}KM',
              activeColor: kEmeraldGreen,
              inactiveColor: kEmeraldGreen.withOpacity(0.2),
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
                onPressed: () =>
                    widget.completer(SheetResponse(responseData: radius)),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: kEmeraldGreen,
                child: Text(
                  'CHANGE RADIUS',
                  style: kButtonTextStyle,
                ),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}
