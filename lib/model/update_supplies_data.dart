import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class UpdateSuppliesData {
  final String schoolName;
  final String suppliesRoom;

  UpdateSuppliesData(this.schoolName, this.suppliesRoom);

  Future<String> uploadImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) throw('error: there is no image');

    File file = File(image.path);
    final filePath = '$schoolName/$suppliesRoom';

    await FirebaseStorage.instance
        .ref(filePath)
        .putFile(file);

    String downloadUrl = await FirebaseStorage.instance
        .ref(filePath)
        .getDownloadURL();

    return downloadUrl;
  }
}