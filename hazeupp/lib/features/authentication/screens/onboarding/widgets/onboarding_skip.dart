import 'package:flutter/material.dart';
import 'package:hazeupp/utils/constants/sizes.dart';
import 'package:hazeupp/utils/device/device_utility.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: TSizes.defaultSpace,
      child: TextButton(
        onPressed: () {},
        child: const Text("Skip"),
      ),
    );
  }
}
