import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:supplies_manage/model/supplies_room_data.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class ManageSuppliesData extends SuppliesRoomData{
  ManageSuppliesData(
      String schoolName,
      String suppliesRoom,
      List<String> name,
      List<int?> amount,
      List<int?> availableAmount,
      List<String?> location,
      List<bool> consumable,
      List<String> imageUrl,
      List<String> applicationUserName,
      List<String> applicationSuppliesName,
      List<int> applicationRentAmount,
      List<String?> applicationRentReason,
      DocumentSnapshot<Map<String, dynamic>> backUpDocumentSnapshot,
      ) : super(
        schoolName,
        suppliesRoom,
        name,
        amount,
        availableAmount,
        location,
        consumable,
        imageUrl,
        applicationUserName,
        applicationSuppliesName,
        applicationRentAmount,
        applicationRentReason,
        backUpDocumentSnapshot,
  );

  static Future<ManageSuppliesData> getData(String schoolName, String suppliesRoom) async{
    final documentSnapshot = await firestore.collection(schoolName).doc(suppliesRoom).get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data = documentSnapshot.data();

      List<String> name = [];
      List<int?> amount = [];
      List<int?> availableAmount = [];
      List<String?> location = [];
      List<bool> consumable = [];
      List<int> imageNum = [];
      List<String> imageUrl = [];
      List<String> applicationUserName = [];
      List<String> applicationSuppliesName = [];
      List<int> applicationRentAmount = [];
      List<String?> applicationRentReason = [];

      if (data != null && data.containsKey('supplies')) {
        List<dynamic> supplies = data['supplies'];

        for (var supply in supplies) {
          name.add(supply['name']);
          amount.add(supply['amount']);
          availableAmount.add(supply['availableAmount']);
          location.add(supply['location']);
          consumable.add(supply['consumable'] ?? false);
          imageNum.add(supply['imageNum']);
        }
      }

      for(int i = 0; i < name.length; i++) {
        if(imageNum[i] == 1) {
          final imagePath = '$userSchoolName/$userSuppliesRoom/${name[i]}';
          imageUrl.add(await FirebaseStorage.instance.ref(imagePath).getDownloadURL());
        }else{
          imageUrl.add(defaultImage);
        }
      }

      if (data != null && data.containsKey('applicationList')) {
        List<dynamic> applications = data['applicationList'];

        for (var application in applications) {
          applicationUserName.add(application['userName']);
          applicationSuppliesName.add(application['suppliesName']);
          applicationRentAmount.add(application['rentAmount']);
          applicationRentReason.add(application['rentReason']);
        }
      }

      return ManageSuppliesData(schoolName, suppliesRoom, name, amount, availableAmount, location,
          consumable, imageUrl, applicationUserName, applicationSuppliesName, applicationRentAmount, applicationRentReason, documentSnapshot);
    }
    throw Exception('에러 발생: 데이터가 손상되었습니다.');
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