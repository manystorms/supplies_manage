import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class UpdateSuppliesData {
  final String schoolName;
  final String suppliesRoom;

  UpdateSuppliesData(this.schoolName, this.suppliesRoom);

  Future<void> inputData(String inputName, int? inputAmount, String? inputLocation, bool inputConsumable) async{
    //준비물 이름이 같은 경우가 없도록 예외 처리 필요
    final documentSnapshot = firestore.collection(schoolName).doc(suppliesRoom);

    final Map<String, dynamic> inputSuppliesData = {
      'name': inputName,
      'amount': inputAmount,
      'availableAmount': inputAmount,
      'location': inputLocation,
      'imageNum': 0,
      'consumable': inputConsumable
    };

    await documentSnapshot.update({
      'supplies': FieldValue.arrayUnion([inputSuppliesData])
    });
  }

  Future<void>  inputImageData(String suppliesName, int imageNum) async{
    uploadImage('$schoolName/$suppliesRoom/${suppliesName+imageNum.toString()}');
  }

  Future<String> uploadImage(String filePath) async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) throw('error: there is no image');

    Uint8List fileBytes = await image.readAsBytes();

    TaskSnapshot snapshot = await FirebaseStorage.instance
        .ref(filePath)
        .putData(fileBytes, SettableMetadata(contentType: 'image/jpeg'));

    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}