import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class ManageSuppliesData{
  final String schoolName;
  final String suppliesRoom;
  final List<String> name;
  final List<int?> amount;
  final List<int?> availableAmount;
  final List<String?> location;
  final List<bool> consumable;
  final List<String?> imageUrl;

  ManageSuppliesData(this.schoolName, this.suppliesRoom, this.name, this.amount,
      this.availableAmount, this.location, this.consumable, this.imageUrl);

  static Future<ManageSuppliesData> getData(String schoolName, String suppliesRoom) async{
    final documentSnapshot = await firestore.collection(schoolName).doc(suppliesRoom).get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data = documentSnapshot.data();
      if (data != null && data.containsKey('supplies')) {
        List<dynamic> supplies = data['supplies'];
        List<String> name = [];
        List<int?> amount = [];
        List<int?> availableAmount = [];
        List<String?> location = [];
        List<bool> consumable = [];
        List<int> imageNum = [];
        List<String?> imageUrl = [];

        for (var supply in supplies) {
          name.add(supply['name']);
          amount.add(supply['amount']);
          availableAmount.add(supply['availableAmount']);
          location.add(supply['location']);
          consumable.add(supply['consumable'] ?? false);
          imageNum.add(supply['imageNum']);
        }

        for(int i = 0; i < name.length; i++) {
          if(imageNum[i] == 1) {
            final imagePath = '$userSchoolName/$userSuppliesRoom/${name[i]}';
            imageUrl.add(await FirebaseStorage.instance.ref(imagePath).getDownloadURL());
          }else{
            imageUrl.add(null);
          }
        }

        return ManageSuppliesData(schoolName, suppliesRoom, name, amount, availableAmount, location, consumable, imageUrl);
      } else {
        throw Exception('error');
      }
    }else{
      throw Exception('error');
    }
  }

  Future<void> inputData(String inputName, int? inputAmount, String? inputLocation, bool inputConsumable) async{
    if(name.contains(inputName) == true) throw Exception('에러 발생: 추가하려는 준비물이 이미 입력되어 있습니다.');

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

  Future<String>  inputImageData(int suppliesNum) async{
    /*if(imageUrl[suppliesNum] == null) {
      throw Exception('이미 이미지가 업로드 되었습니다');
    }*/

    String imageUrl = await uploadImage('$schoolName/$suppliesRoom/${name[suppliesNum].toString()}');

    final documentSnapshot = firestore.collection(schoolName).doc(suppliesRoom);

    final currentData = await documentSnapshot.get();
    if(currentData.exists) {
      Map<String, dynamic>? data = currentData.data();
      if(data != null && data.containsKey('supplies')) {
        List<dynamic> supplies = data['supplies'];
        supplies[suppliesNum]['imageNum'] = 1;
        await documentSnapshot.update({'supplies': supplies});
      }else{
        throw Exception('에러 발생: 데이터가 손상되었습니다. 관리자에게 문의하세요.');
      }
    }

    return imageUrl;
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