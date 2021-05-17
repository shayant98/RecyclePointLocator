import 'package:flutter/material.dart';
import 'package:rpl/ui/shared/styles.dart';

class RadiusSlider extends StatelessWidget {
  final double radius;
  final void Function(double value) onChanged;

  const RadiusSlider({Key? key, required this.radius, required this.onChanged}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 5.0,
      max: 20.0,
      value: radius,
      divisions: 15,
      label: 'Radius of ${radius}KM',
      activeColor: kEmeraldGreen,
      inactiveColor: kEmeraldGreen.withOpacity(0.2),
      onChanged: onChanged,
    );
  }
}
