import 'package:flutter/material.dart';
import 'package:hazeupp/common/widgets/appbar/appbar.dart';
import 'package:hazeupp/features/shop/screens/product_reviews/widgets/overall_product_indicator.dart';
import 'package:hazeupp/features/shop/screens/product_reviews/widgets/rating_bar_indicator.dart';
import 'package:hazeupp/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:hazeupp/utils/constants/sizes.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(
        title: Text("Reviews & Rating"),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Rating and reviews are verified and are from people who use the same type of device that you use."),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Overall Product Rating
              const TOverallProductIndicator(),

              TRatingBarIndicator(rating: 3.5),
              Text("12,611", style: Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: TSizes.spaceBtwSections),

              // User Review List
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
