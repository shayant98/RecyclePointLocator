import 'package:flutter/material.dart';
import 'package:rpl/ui/dumb_widgets/leaf_clipper.dart';
import 'package:rpl/ui/quick_find/quick_find_viewmodel.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';
import 'package:stacked/stacked.dart';

class QuickFindView extends StatelessWidget {
  const QuickFindView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<QuickFindViewModel>.reactive(
      builder: (context, model, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            LeafClipper(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpaceMedium,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingSmall),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: IconButton(
                        color: kEmeraldGreen,
                        icon: Icon(Icons.arrow_back),
                        onPressed: model.navigateToHome),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: Text("Quick Find", style: kTitleTextStyle),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: Text("Quickly find the nearest recyclepoint",
                      style: kSubtitleTextStyle),
                ),
                verticalSpaceLarge,
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: Text(
                    "Materials to recycle",
                    style: kBodyTextStyle.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                verticalSpaceSmall,
                Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: paddingMedium),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Chip(
                          backgroundColor: kEmeraldGreen,
                          label: Icon(
                            Icons.ac_unit,
                            color: kPlatinum,
                          ),
                        ),
                        Chip(
                          label: Icon(
                            Icons.ac_unit,
                          ),
                        ),
                        Chip(
                          label: Icon(
                            Icons.ac_unit,
                          ),
                        )
                      ],
                    )),
              ],
            ),
            DraggableScrollableSheet(
                builder: (context, controller) => Container())
          ],
        ),
      ),
      viewModelBuilder: () => QuickFindViewModel(),
    );
  }
}
