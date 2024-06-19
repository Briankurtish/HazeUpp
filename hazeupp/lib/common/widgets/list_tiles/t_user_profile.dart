import 'package:flutter/material.dart';
import 'package:hazeupp/common/widgets/images/t_circular_image.dart';
import 'package:hazeupp/utils/constants/colors.dart';
import 'package:hazeupp/utils/constants/image_strings.dart';
import 'package:iconsax/iconsax.dart';

class TUserProfile extends StatelessWidget {
  const TUserProfile({
    super.key,
    required this.onPressed,
  });

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: TCircularImage(
          image: TImages.user, width: 50, height: 50, padding: 0),
      title: Text(
        "Basar Cipher",
        style: Theme.of(context)
            .textTheme
            .headlineSmall!
            .apply(color: TColors.white),
      ),
      subtitle: Text(
        "Basarcipher@gmail.com",
        style:
            Theme.of(context).textTheme.bodyMedium!.apply(color: TColors.white),
      ),
      trailing: IconButton(
        onPressed: onPressed,
        icon: Icon(
          Iconsax.edit,
          color: TColors.white,
        ),
      ),
    );
  }
}
