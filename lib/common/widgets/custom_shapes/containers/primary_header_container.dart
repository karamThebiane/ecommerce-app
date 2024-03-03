import 'package:bakaata/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:bakaata/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:bakaata/utils/constants/colors.dart';
import 'package:bakaata/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


/// A container widget with a primary color background and curved edges.
class TPrimaryHeaderContainer extends StatelessWidget {
  /// Create a container with a primary color background and curved edges.
  ///
  /// Parameters:
  ///   - child: The widget to be placed inside the container.
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurvedEdgesWidget(
      child: Container(
        color: THelperFunction.isDarkMode(context) ? TColors.secondary :TColors.primary,
        padding: const EdgeInsets.only(bottom: 0),

        /// -- If [size.isFinite': is not true.in Stack] error occurred -> Read README.md file at [DESIGN ERRORS] # 1
        child: Stack(
          children: [
            /// -- Background Custom Shapes
            Positioned(
                top: -150, right: -250, child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
            Positioned(
                top: 100, right: -300, child: TCircularContainer(backgroundColor: TColors.textWhite.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}
