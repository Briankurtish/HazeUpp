import 'package:flutter/material.dart';
import 'package:hazeupp/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:hazeupp/features/shop/screens/product_reviews/widgets/rating_bar_indicator.dart';
import 'package:hazeupp/utils/constants/colors.dart';
import 'package:hazeupp/utils/constants/image_strings.dart';
import 'package:hazeupp/utils/constants/sizes.dart';
import 'package:hazeupp/utils/helpers/helper_functions.dart';
import 'package:readmore/readmore.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                    backgroundImage: AssetImage(TImages.userProfileImage1)),
                const SizedBox(width: TSizes.spaceBtwItems),
                Text("John Doe", style: Theme.of(context).textTheme.bodyMedium),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(width: TSizes.spaceBtwItems),

        // Review
        Row(
          children: [
            const TRatingBarIndicator(rating: 4.0),
            const SizedBox(width: TSizes.spaceBtwItems),
            Text("01 Nov 2023", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),

        const SizedBox(height: TSizes.spaceBtwItems),
        const ReadMoreText(
          "The jacket includes a zip-up front, a high collar, and ribbed cuffs for a snug fit. The matching pants have an elastic waistband and drawstring for adjustable comfort, with tapered legs and zippered pockets for practicality. Made from a blend of high-quality, breathable fabrics, this tracksuit provides excellent mobility and moisture-wicking properties, ensuring you stay dry and comfortable during any activity.",
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: " show less",
          trimCollapsedText: " show more",
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        // Company Review
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Haze Upp",
                        style: Theme.of(context).textTheme.bodyLarge),
                    Text("02 Nov 2023",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems),
                const ReadMoreText(
                  "The jacket includes a zip-up front, a high collar, and ribbed cuffs for a snug fit. The matching pants have an elastic waistband and drawstring for adjustable comfort, with tapered legs and zippered pockets for practicality. Made from a blend of high-quality, breathable fabrics, this tracksuit provides excellent mobility and moisture-wicking properties, ensuring you stay dry and comfortable during any activity.",
                  trimLines: 2,
                  trimMode: TrimMode.Line,
                  trimExpandedText: " show less",
                  trimCollapsedText: " show more",
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: TSizes.spaceBtwSections),
      ],
    );
  }
}
