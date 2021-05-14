import 'package:flutter/material.dart';
import 'package:rpl/ui/shared/styles.dart';
import 'package:rpl/ui/shared/ui_helpers.dart';

class LeafClipper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment(0, 140),
      child: ClipPath(
        clipper: _LeafClipPath(),
        child: Container(
          height: screenHeight(context) * 0.99,
          color: kEmeraldGreen,
        ),
      ),
    );
  }
}

class _LeafClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    final double _xScaling = size.width / 414;
    final double _yScaling = size.height / 896;
    path.lineTo(229.307 * _xScaling, 9.4796 * _yScaling);
    path.cubicTo(
      228.06 * _xScaling,
      6.10267 * _yScaling,
      225.032 * _xScaling,
      3.87536 * _yScaling,
      221.665 * _xScaling,
      3.83929 * _yScaling,
    );
    path.cubicTo(
      -101.835 * _xScaling,
      0.374113 * _yScaling,
      -138.311 * _xScaling,
      144.647 * _yScaling,
      -138.977 * _xScaling,
      206.843 * _yScaling,
    );
    path.cubicTo(
      -139.217 * _xScaling,
      229.219 * _yScaling,
      -134.839 * _xScaling,
      250.168 * _yScaling,
      -125.955 * _xScaling,
      269.097 * _yScaling,
    );
    path.cubicTo(
      -124.586 * _xScaling,
      272.026 * _yScaling,
      -121.839 * _xScaling,
      273.908 * _yScaling,
      -118.805 * _xScaling,
      274.013 * _yScaling,
    );
    path.cubicTo(
      -115.937 * _xScaling,
      273.953 * _yScaling,
      -112.902 * _xScaling,
      272.44 * _yScaling,
      -111.355 * _xScaling,
      269.596 * _yScaling,
    );
    path.cubicTo(
      -89.0796 * _xScaling,
      229.108 * _yScaling,
      -26.1542 * _xScaling,
      129.262 * _yScaling,
      76.5614 * _xScaling,
      76.9555 * _yScaling,
    );
    path.cubicTo(
      80.7692 * _xScaling,
      74.8419 * _yScaling,
      85.7507 * _xScaling,
      76.7478 * _yScaling,
      87.6864 * _xScaling,
      81.2123 * _yScaling,
    );
    path.cubicTo(
      89.639 * _xScaling,
      85.7123 * _yScaling,
      87.8471 * _xScaling,
      91.0897 * _yScaling,
      83.6901 * _xScaling,
      93.2037 * _yScaling,
    );
    path.cubicTo(
      75.945 * _xScaling,
      97.1505 * _yScaling,
      68.4961 * _xScaling,
      101.46 * _yScaling,
      61.1954 * _xScaling,
      105.932 * _yScaling,
    );
    path.cubicTo(
      58.4096 * _xScaling,
      107.647 * _yScaling,
      55.7055 * _xScaling,
      109.471 * _yScaling,
      52.9689 * _xScaling,
      111.258 * _yScaling,
    );
    path.cubicTo(
      48.855 * _xScaling,
      113.949 * _yScaling,
      44.7913 * _xScaling,
      116.693 * _yScaling,
      40.8258 * _xScaling,
      119.529 * _yScaling,
    );
    path.cubicTo(
      36.878 * _xScaling,
      122.329 * _yScaling,
      32.9786 * _xScaling,
      125.202 * _yScaling,
      29.1456 * _xScaling,
      128.146 * _yScaling,
    );
    path.cubicTo(
      27.9517 * _xScaling,
      129.069 * _yScaling,
      26.8084 * _xScaling,
      130.01 * _yScaling,
      25.6307 * _xScaling,
      130.951 * _yScaling,
    );
    path.cubicTo(
      -76.9047 * _xScaling,
      211.592 * _yScaling,
      -140.417 * _xScaling,
      341.31 * _yScaling,
      -140.904 * _xScaling,
      386.708 * _yScaling,
    );
    path.cubicTo(
      -140.957 * _xScaling,
      391.672 * _yScaling,
      -137.265 * _xScaling,
      395.742 * _yScaling,
      -132.664 * _xScaling,
      395.791 * _yScaling,
    );
    path.cubicTo(
      -128.063 * _xScaling,
      395.84 * _yScaling,
      -124.285 * _xScaling,
      391.851 * _yScaling,
      -124.232 * _xScaling,
      386.887 * _yScaling,
    );
    path.cubicTo(
      -124.077 * _xScaling,
      372.389 * _yScaling,
      -114.61 * _xScaling,
      343.098 * _yScaling,
      -96.9133 * _xScaling,
      308.228 * _yScaling,
    );
    path.cubicTo(
      -72.0108 * _xScaling,
      330.675 * _yScaling,
      -38.312 * _xScaling,
      342.836 * _yScaling,
      1.28186 * _xScaling,
      343.26 * _yScaling,
    );
    path.cubicTo(
      108.326 * _xScaling,
      344.407 * _yScaling,
      131.926 * _xScaling,
      234.75 * _yScaling,
      144.595 * _xScaling,
      175.83 * _yScaling,
    );
    path.cubicTo(
      161.65 * _xScaling,
      96.5389 * _yScaling,
      197.806 * _xScaling,
      50.4982 * _yScaling,
      227.386 * _xScaling,
      19.2453 * _yScaling,
    );
    path.cubicTo(
      229.814 * _xScaling,
      16.6987 * _yScaling,
      230.555 * _xScaling,
      12.8565 * _yScaling,
      229.307 * _xScaling,
      9.4796 * _yScaling,
    );
    path.cubicTo(
      229.307 * _xScaling,
      9.4796 * _yScaling,
      229.307 * _xScaling,
      9.4796 * _yScaling,
      229.307 * _xScaling,
      9.4796 * _yScaling,
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
