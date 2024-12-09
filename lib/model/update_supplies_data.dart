import 'dart:typed_data';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class UpdateSuppliesData {
  final String schoolName;
  final String suppliesRoom;

  UpdateSuppliesData(this.schoolName, this.suppliesRoom);

  Future<void> inputData(String inputName, int inputAmount, bool inputConsumable) async{
    final documentSnapshot = firestore.collection(schoolName).doc(suppliesRoom);

    final Map<String, dynamic> inputSuppliesData = {
      'name': inputName,
      'amount': inputAmount,
      'availableAmount': inputAmount,
      'consumable': inputConsumable
    };

    await documentSnapshot.update({
      'supplies': FieldValue.arrayUnion([inputSuppliesData])
    });
  }

  Future<String> uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) throw('error: there is no image');

    Uint8List fileBytes = await image.readAsBytes();
    final uniqueFileName = const Uuid().v4();
    final filePath = '$schoolName/$suppliesRoom/$uniqueFileName';

    TaskSnapshot snapshot = await FirebaseStorage.instance
        .ref(filePath)
        .putData(fileBytes, SettableMetadata(contentType: 'image/jpeg'));

    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}