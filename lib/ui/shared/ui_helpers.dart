// Horizontal Spacing
import 'package:flutter/material.dart';

const Widget horizontalSpaceTiny = SizedBox(
  width: 5,
);
const Widget horizontalSpaceSmall = SizedBox(
  width: 10,
);
const Widget horizontalSpaceRegular = SizedBox(
  width: 18,
);
const Widget horizontalSpaceMedium = SizedBox(
  width: 25,
);
const Widget horizontalSpaceLarge = SizedBox(
  width: 50,
);

//Vertical Spacing
const Widget verticalSpaceTiny = SizedBox(
  height: 5,
);
const Widget verticalSpaceSmall = SizedBox(
  height: 10,
);
const Widget verticalSpaceRegular = SizedBox(
  height: 18,
);
const Widget verticalSpaceMedium = SizedBox(
  height: 25,
);
const Widget verticalSpaceLarge = SizedBox(
  height: 50,
);

// Screen Size Helpers
double screenWidth(BuildContext context) => MediaQuery.of(context).size.width;
double screenHeight(BuildContext context) => MediaQuery.of(context).size.height;

double screenHeightPercentage(BuildContext context, {double percentage = 1}) => screenHeight(context) * percentage;

double screenWidthPercentage(BuildContext context, {double percentage = 1}) => screenHeight(context) * percentage;

bool isDarkTheme(BuildContext context) => MediaQuery.of(context).platformBrightness == Brightness.dark;
