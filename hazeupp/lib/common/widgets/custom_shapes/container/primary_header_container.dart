import 'package:flutter/material.dart';
import 'package:hazeupp/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:hazeupp/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:hazeupp/utils/constants/colors.dart';
import 'package:hazeupp/utils/helpers/helper_functions.dart';

class THeaderPrimaryContainer extends StatelessWidget {
  const THeaderPrimaryContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.dark : TColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircularConatiner(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              Positioned(
                top: 100,
                right: -300,
                child: TCircularConatiner(
                  backgroundColor: TColors.textWhite.withOpacity(0.1),
                ),
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
