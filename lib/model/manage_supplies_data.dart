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
      List<String> applicationRentState,
      List<String> applicationRentId,
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
        applicationRentState,
        applicationRentId,
  );
  XFile? imageFile;

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
      List<String> applicationRentState = [];
      List<String> applicationRentId = [];

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
          applicationRentState.add(application['rentState']);
          applicationRentId.add(application['rentId']);
        }
      }

      return ManageSuppliesData(schoolName, suppliesRoom, name, amount, availableAmount, location, consumable,
          imageUrl, applicationUserName, applicationSuppliesName, applicationRentAmount, applicationRentReason, applicationRentState, applicationRentId);
    }
    throw Exception('에러 발생: 데이터가 손상되었습니다.');
  }

  Future<void> removeData(String suppliesName) async{
    await firestore.runTransaction((transaction) async {
      DocumentReference docRef = firestore.collection(schoolName).doc(suppliesRoom);

      DocumentSnapshot documentSnapshot = await transaction.get(docRef);

      if(!documentSnapshot.exists) throw('에러 발생');

      var data = documentSnapshot.data() as Map<String, dynamic>;
      List<dynamic> supplies = List.from(data['supplies'] ?? []);
      List<dynamic> application = List.from(data['applicationList'] ?? []);

      application.removeWhere((item) => item['suppliesName'] == suppliesName);

      int index = supplies.indexWhere((item) => item['name'] == suppliesName);
      if(index == -1) throw ('에러 발생');

      supplies.removeAt(index);
      transaction.update(docRef, {'supplies':supplies, 'applicationList':application});
    });
  }

  Future<void> modifyData(String suppliesName, int? inputAmount, String? inputLocation, bool inputConsumable) async{
    await firestore.runTransaction((transaction) async {
      DocumentReference docRef = firestore.collection(schoolName).doc(suppliesRoom);

      DocumentSnapshot documentSnapshot = await transaction.get(docRef);

      if(!documentSnapshot.exists) throw('에러 발생');

      var data = documentSnapshot.data() as Map<String, dynamic>;
      List<dynamic> supplies = List.from(data['supplies'] ?? []);

      int index = supplies.indexWhere((item) => item['name'] == suppliesName);
      if(index == -1) throw ('에러 발생');

      if(inputAmount != null && inputAmount < supplies[index]['availableAmount']) throw('wrongAmount');

      supplies[index]['availableAmount'] += (inputAmount != null)? inputAmount - supplies[index]['amount']:null;
      supplies[index]['amount'] = inputAmount;
      if(inputLocation != null) supplies[index]['location']  = inputLocation;
      supplies[index]['consumable'] = inputConsumable;

      transaction.update(docRef, {'supplies':supplies});
    });
  }

  Future<void> inputData(String inputName, int? inputAmount, String? inputLocation, bool inputConsumable) async{
    await firestore.runTransaction((transaction) async {
      final documentRef = firestore.collection(schoolName).doc(suppliesRoom);
      final documentSnapshot = await transaction.get(documentRef);

      if (!documentSnapshot.exists) throw ('문서가 존재하지 않습니다.');

      final data = documentSnapshot.data() as Map<String, dynamic>;
      List<dynamic> supplies = List.from(data['supplies'] ?? []);

      if (supplies.any((item) => item['name'] == inputName)) throw ('duplicationName');

      final Map<String, dynamic> inputSuppliesData = {
        'name': inputName,
        'amount': inputAmount,
        'availableAmount': inputAmount,
        'location': inputLocation,
        'imageNum': 0,
        'consumable': inputConsumable,
      };
      supplies.add(inputSuppliesData);
      transaction.update(documentRef, {'supplies': supplies});
    });

    name.add(inputName);
    amount.add(inputAmount);
    availableAmount.add(inputAmount);
    location.add(inputLocation);
    consumable.add(inputConsumable);
    imageUrl.add(defaultImage);

    if(imageFile != null) imageUrl.last = await inputImageData(name.length-1);
  }

  Future<void> getImage() async{
    final ImagePicker picker = ImagePicker();
    imageFile = await picker.pickImage(source: ImageSource.gallery);

    if (imageFile == null) throw Exception('error: there is no image');
  }

  Future<String>  inputImageData(int suppliesNum) async{
    String imageUrl = await uploadImage('$schoolName/$ㅊsuppliesRoom/${name[suppliesNum].toString()}');

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
    final tempImage = imageFile;
    if (tempImage == null) throw Exception('에러 발생');

    Uint8List fileBytes = await tempImage.readAsBytes();

    TaskSnapshot snapshot = await FirebaseStorage.instance
        .ref(filePath)
        .putData(fileBytes, SettableMetadata(contentType: 'image/jpeg'));

    String downloadUrl = await snapshot.ref.getDownloadURL();

    return downloadUrl;
  }
}


Future<List<Map<String, dynamic>>> getRentLog(int year, int month) async {
  final String documentName = year.toString()+month.toString().padLeft(2, '0');

  DocumentSnapshot documentSnapshot = await firestore
      .collection(userSchoolName)
      .doc(userSuppliesRoom)
      .collection('log')
      .doc(documentName)
      .get();

  if(!documentSnapshot.exists) throw ('noLogData');

  Map<String, dynamic>? logData = documentSnapshot.data() as Map<String, dynamic>?;
  if (logData == null) throw ('noLogData');

  List<dynamic> logs = logData['log'] ?? [];
  return logs.cast<Map<String, dynamic>>();
}