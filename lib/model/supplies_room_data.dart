import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:supplies_manage/model/user_data.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class SuppliesRoomData{
  final String schoolName;
  final String suppliesRoom;
  final List<String> name;
  final List<int?> amount;
  final List<int?> availableAmount;
  final List<String?> location;
  final List<bool> consumable;
  final List<String?> imageUrl;
  final List<String> applicationUserName;
  final List<String> applicationSuppliesName;
  final List<int> applicationRentAmount;

  SuppliesRoomData(this.schoolName, this.suppliesRoom, this.name, this.amount, this.availableAmount, this.location,
      this.consumable, this.imageUrl, this.applicationUserName, this.applicationSuppliesName, this.applicationRentAmount);

  static Future<SuppliesRoomData> getData(String schoolName, String suppliesRoom) async{
    final documentSnapshot = await firestore.collection(schoolName).doc(suppliesRoom).get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data = documentSnapshot.data();

      List<String> name = [];
      List<int?> amount = [];
      List<int?> availableAmount = [];
      List<String?> location = [];
      List<bool> consumable = [];
      List<int> imageNum = [];
      List<String?> imageUrl = [];
      List<String> applicationUserName = [];
      List<String> applicationSuppliesName = [];
      List<int> applicationRentAmount = [];

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
          imageUrl.add(null);
        }
      }

      if (data != null && data.containsKey('applicationList')) {
        List<dynamic> applications = data['applicationList'];

        for (var application in applications) {
          applicationUserName.add(application['userName']);
          applicationSuppliesName.add(application['suppliesName']);
          applicationRentAmount.add(application['rentAmount']);
        }
      }

      return SuppliesRoomData(schoolName, suppliesRoom, name, amount, availableAmount,
          location, consumable, imageUrl, applicationUserName, applicationSuppliesName, applicationRentAmount);
    }else{
      throw Exception('에러 발생: 데이터가 손상되었습니다.');
    }
  }

  Future<void> rentSupplies(int suppliesNum, int rentAmount, String userName, String rentReason) async {
    //현재 상태 업데이트 필요. 변경사항 없는지 체크
    if(amount[suppliesNum] == null || availableAmount[suppliesNum] == null) return;

    if((availableAmount[suppliesNum]??0) < rentAmount) {
      throw Exception('에러 발생: 대여하려는 준비물의 수가 대여가능한 준비물의 수보다 많습니다.');
    }

    availableAmount[suppliesNum] = (availableAmount[suppliesNum]??0) - rentAmount;

    final documentSnapshot = firestore.collection(schoolName).doc(suppliesRoom);

    final currentData = await documentSnapshot.get();
    if(currentData.exists) {
      Map<String, dynamic>? data = currentData.data();
      if(data != null && data.containsKey('supplies')) {
        List<dynamic> applicationList = data['applicationList'];

        if(rentReason == '') {
          applicationList.add({
            'userName': userName,
            'suppliesName': name[suppliesNum],
            'rentAmount': rentAmount
          });
        }else{
          applicationList.add({
            'userName': userName,
            'suppliesName': name[suppliesNum],
            'rentAmount': rentAmount,
            'rentReason': rentReason
          });
        }


        List<dynamic> supplies = data['supplies'];
        supplies[suppliesNum]['availableAmount'] = availableAmount[suppliesNum];

        await documentSnapshot.update({'applicationList': applicationList, 'supplies': supplies});
      }else{
        throw Exception('에러 발생: 데이터가 손상되었습니다. 관리자에게 문의하세요.');
      }
    }
  }

  Future<void> rentCancel(String userName) async {
    final applicatioinNum = applicationUserName.indexOf(userName);
    if(applicatioinNum == -1) throw Exception('준비물을 예약한 적이 없습니다.');

    final suppliesNum = name.indexOf(applicationSuppliesName[applicatioinNum]);
    if(availableAmount[suppliesNum] != null) {
      availableAmount[suppliesNum] = (availableAmount[suppliesNum]??0)+applicationRentAmount[applicatioinNum];
    }

    applicationUserName.removeAt(applicatioinNum);
    applicationSuppliesName.removeAt(applicatioinNum);
    applicationRentAmount.removeAt(applicatioinNum);


  }

  /*Future<void> sendUpdateData() async{
    final documentSnapshot = firestore.collection(schoolName).doc(suppliesRoom);
    List<dynamic> applicationList = data['applicationList'];

    List<dynamic> supplies = data['supplies'];
    supplies[suppliesNum]['availableAmount'] = availableAmount[suppliesNum];


    await documentSnapshot.update({'applicationList': applicationList, 'supplies': supplies});
  }*/
}

