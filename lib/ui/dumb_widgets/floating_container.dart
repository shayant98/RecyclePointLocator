import 'package:flutter/material.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:stacked_themes/stacked_themes.dart';

class FloatingContainer extends StatelessWidget {
  final Widget child;

  const FloatingContainer({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: paddingSmall, vertical: paddingSmall),
      decoration: BoxDecoration(
        color: getThemeManager(context).isDarkMode ? kPhthaloGreen : kPlatinum,
        boxShadow: [
          BoxShadow(
            color: getThemeManager(context).isDarkMode ? Colors.black38 : Colors.black12, //color of shadow
            spreadRadius: 0, //spread radius
            blurRadius: 4, // blur radius
            offset: Offset(1, 2), // changes position of shadow
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: child,
    );
  }
}
