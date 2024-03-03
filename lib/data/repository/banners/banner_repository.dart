import 'package:bakaata/data/services/cloud_storage/firebase_storage_services.dart';
import 'package:bakaata/features/shop/models/banner_model.dart';
import 'package:bakaata/utils/exaptions/firebase_excaption.dart';
import 'package:bakaata/utils/exaptions/format_exceptions.dart';
import 'package:bakaata/utils/exaptions/platform_exception.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /* ---------------------------- FUNCTIONS ---------------------------------*/

  /// Get all order related to current User
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection('Banners').where('active', isEqualTo: true).limit(3).get();
      return result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
    }
  }


  /// Upload Banners to the Cloud Firebase
  Future<void> uploadBannersDummyData(List<BannerModel> banners) async {
    try {
      // Upload all the Categories along with their Images
      final storage = Get.put(TFirebaseStorageService());
      // Loop through each category
      for (var entry in banners) {
        // Get ImageData link from the local assets
        final thumbnail = await storage.getImageDataFromAssets(entry.imageUrl);

        // Upload Image and Get its URL
        final url = await storage.uploadImageData('Banners', thumbnail, entry.imageUrl.toString());

        // Assign URL to Brand.image attribute
        entry.imageUrl = url;

        // Store Category in Firestore
        await _db.collection("Banners").doc().set(entry.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
