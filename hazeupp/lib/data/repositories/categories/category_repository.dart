import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:hazeupp/data/services/firebase_storage_service.dart';
import 'package:hazeupp/features/shop/models/category_model.dart';
import 'package:hazeupp/utils/exceptions/firebase_exceptions.dart';
import 'package:hazeupp/utils/exceptions/format_exceptions.dart';
import 'package:hazeupp/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  // Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  // Get Sub categories

  // Upload Categories to the cloud firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      // Upload all categories with their names
      final storage = Get.put(TFirebaseStorageService());

      // Loop through all categories
      for (var category in categories) {
        // Get image data link from local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload image and get its url
        final url =
            await storage.uploadImageData("Categories", file, category.name);

        // assign url to category.image attribute
        category.image = url;

        // Store Category in Firebase
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }
}
