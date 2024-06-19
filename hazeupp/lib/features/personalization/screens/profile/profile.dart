import 'package:flutter/material.dart';
import 'package:hazeupp/common/widgets/appbar/appbar.dart';
import 'package:hazeupp/common/widgets/images/t_circular_image.dart';
import 'package:hazeupp/common/widgets/texts/section_heading.dart';
import 'package:hazeupp/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:hazeupp/utils/constants/image_strings.dart';
import 'package:hazeupp/utils/constants/sizes.dart';
import 'package:iconsax/iconsax.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              // Profile Picture
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    TCircularImage(
                      image: TImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text("Change Profile Picture"),
                    ),
                  ],
                ),
              ),

              // Details
              const SizedBox(height: TSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Heading Profile Info
              TSectionHeading(
                  title: "Profile Information", showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                title: "Name",
                value: "Basar Cipher",
                onPressed: () {},
              ),

              TProfileMenu(
                title: "Username",
                value: "basar_Cpx",
                onPressed: () {},
              ),

              const SizedBox(height: TSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              // Heading Personal Info
              TSectionHeading(
                  title: "Personal Information", showActionButton: false),
              const SizedBox(height: TSizes.spaceBtwItems),

              TProfileMenu(
                title: "User ID",
                value: "450953",
                icon: Iconsax.copy,
                onPressed: () {},
              ),

              TProfileMenu(
                title: "E-mail",
                value: "basarcipher@gmail.com",
                onPressed: () {},
              ),

              TProfileMenu(
                title: "Phone Number",
                value: "+90543765748",
                onPressed: () {},
              ),

              TProfileMenu(
                title: "Gender",
                value: "Male",
                onPressed: () {},
              ),

              TProfileMenu(
                title: "Date of Birth",
                value: "10 Oct, 1994",
                onPressed: () {},
              ),

              const Divider(),
              const SizedBox(height: TSizes.spaceBtwItems),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Close Account",
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
