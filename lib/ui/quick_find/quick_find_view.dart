import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rpl/enum/material_type.dart';
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
                    child: IconButton(color: kEmeraldGreen, icon: Icon(Icons.arrow_back), onPressed: model.navigateToHome),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: Text("Quick Find", style: kTitleTextStyle),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: Text("Quickly find the nearest recyclepoint", style: kSubtitleTextStyle),
                ),
                verticalSpaceLarge,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: Text(
                    "Materials to recycle",
                    style: kTitleTextStyle.copyWith(fontSize: 18),
                  ),
                ),
                verticalSpaceRegular,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => model.toggleSelect(RecycleMaterialType.glass),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: model.selectedMaterials.contains(RecycleMaterialType.glass) ? kEmeraldGreen : kPlatinum,
                          foregroundColor: model.selectedMaterials.contains(RecycleMaterialType.glass) ? kPlatinum : kEmeraldGreen,
                          child: Icon(
                            FontAwesomeIcons.glassMartini,
                            size: 20,
                          ),
                        ),
                      ),
                      horizontalSpaceMedium,
                      GestureDetector(
                        onTap: () => model.toggleSelect(RecycleMaterialType.paper),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: model.selectedMaterials.contains(RecycleMaterialType.paper) ? kEmeraldGreen : kPlatinum,
                          foregroundColor: model.selectedMaterials.contains(RecycleMaterialType.paper) ? kPlatinum : kEmeraldGreen,
                          child: Icon(
                            FontAwesomeIcons.box,
                            size: 20,
                          ),
                        ),
                      ),
                      horizontalSpaceMedium,
                      GestureDetector(
                        onTap: () => model.toggleSelect(RecycleMaterialType.plastic),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: model.selectedMaterials.contains(RecycleMaterialType.plastic) ? kEmeraldGreen : kPlatinum,
                          foregroundColor: model.selectedMaterials.contains(RecycleMaterialType.plastic) ? kPlatinum : kEmeraldGreen,
                          child: Icon(
                            FontAwesomeIcons.shoppingBag,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpaceLarge,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: Text(
                    "Search radius",
                    style: kTitleTextStyle.copyWith(fontSize: 18),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingRegular),
                  child: Slider(
                    min: 25.0,
                    max: 100.0,
                    divisions: 3,
                    value: 25,
                    label: 'Radius of ${25}KM',
                    activeColor: kEmeraldGreen,
                    inactiveColor: kEmeraldGreen.withOpacity(0.2),
                    onChanged: (double value) {},
                  ),
                ),
                Spacer(),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          heroTag: "quickFind",
          onPressed: () {},
          child: Icon(
            FontAwesomeIcons.search,
            size: 16,
          ),
        ),
      ),
      viewModelBuilder: () => QuickFindViewModel(),
    );
  }
}
