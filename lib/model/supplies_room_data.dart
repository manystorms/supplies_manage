import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

const defaultImage = 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbnOSHZ%2FbtrLTB8V5DQ%2FnlaUCKg7kzbp7PbVKy63Qk%2Fimg.png';

class SuppliesRoomData{
  final String schoolName;
  final String suppliesRoom;
  final List<String> name;
  final List<int?> amount;
  final List<int?> availableAmount;
  final List<String?> location;
  final List<bool> consumable;
  final List<String> imageUrl;
  final List<String> applicationUserName;
  final List<String> applicationSuppliesName;
  final List<int> applicationRentAmount;
  final List<String?> applicationRentReason;
  final List<String> applicationRentState;
  final DocumentSnapshot<Map<String, dynamic>> backUpDocumentSnapshot;

  SuppliesRoomData(this.schoolName, this.suppliesRoom, this.name, this.amount, this.availableAmount, this.location, this.consumable, this.imageUrl,
      this.applicationUserName, this.applicationSuppliesName, this.applicationRentAmount, this.applicationRentReason, this.applicationRentState, this.backUpDocumentSnapshot);

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
      List<String> imageUrl = [];
      List<String> applicationUserName = [];
      List<String> applicationSuppliesName = [];
      List<int> applicationRentAmount = [];
      List<String?> applicationRentReason = [];
      List<String> applicationRentState = [];

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
        }
      }

      return SuppliesRoomData(schoolName, suppliesRoom, name, amount, availableAmount, location, consumable,
          imageUrl, applicationUserName, applicationSuppliesName, applicationRentAmount, applicationRentReason, applicationRentState, documentSnapshot);
    }
    throw Exception('에러 발생: 데이터가 손상되었습니다.');
  }

  Future<void> rentSupplies(int suppliesNum, int rentAmount, String userName, String rentReason) async {
    if(amount[suppliesNum] == null || availableAmount[suppliesNum] == null) return;

    if((availableAmount[suppliesNum]??0) < rentAmount) {
      throw Exception('에러 발생: 대여하려는 준비물의 수가 대여가능한 준비물의 수보다 많습니다.');
    }

    availableAmount[suppliesNum] = (availableAmount[suppliesNum]??0) - rentAmount;

    final documentSnapshot = firestore.collection(schoolName).doc(suppliesRoom);
    final currentData = await documentSnapshot.get();

    /*if(currentData != backUpDocumentSnapshot) {
      throw Exception('에러 발생: 데이터가 변경되었습니다.\n새로고침을 하고 다시 시도하세요.');
    }*/

    if(currentData.exists) {
      Map<String, dynamic>? data = currentData.data();
      if(data != null && data.containsKey('supplies')) {
        List<dynamic> applicationList = data['applicationList'];

        if(rentReason == '') {
          applicationList.add({
            'userName': userName,
            'suppliesName': name[suppliesNum],
            'rentAmount': rentAmount,
            'rentState': '대여 신청'
          });
        }else{
          applicationList.add({
            'userName': userName,
            'suppliesName': name[suppliesNum],
            'rentAmount': rentAmount,
            'rentReason': rentReason,
            'rentState': '대여 신청'
          });
        }

        List<dynamic> supplies = data['supplies'];
        supplies[suppliesNum]['availableAmount'] = availableAmount[suppliesNum];

        await documentSnapshot.update({'applicationList': applicationList, 'supplies': supplies});
        return;
      }
    }
    throw Exception('에러 발생: 데이터가 손상되었습니다. 관리자에게 문의하세요.');
  }

  Future<void> rentCancel(int applicationNum) async {
    final applicationName = applicationSuppliesName[applicationNum];
    final suppliesNum = name.indexOf(applicationName);
    if(suppliesNum == -1) {
      throw Exception('에러 발생: 데이터가 손상되었습니다.');
    }

    Map<String, dynamic> removedApplication = {};
    if(applicationRentReason[applicationNum] == null) {
      removedApplication = {
        'rentAmount': applicationRentAmount[applicationNum],
        'suppliesName': applicationSuppliesName[applicationNum],
        'userName': applicationUserName[applicationNum],
        'rentState': applicationRentState[applicationNum]
      };
    }else{
      removedApplication = {
        'rentAmount': applicationRentAmount[applicationNum],
        'suppliesName': applicationSuppliesName[applicationNum],
        'userName': applicationUserName[applicationNum],
        'rentReason':applicationRentReason[applicationNum],
        'rentState': applicationRentState[applicationNum]
      };
    }

    final documentSnapshot = firestore.collection(schoolName).doc(suppliesRoom);
    final currentData = await documentSnapshot.get();

    /*if(currentData != backUpDocumentSnapshot) {
      throw Exception('에러 발생: 데이터가 변경되었습니다.\n새로고침을 하고 다시 시도하세요.');
    }*/

    if (!currentData.exists) {
      throw Exception('에러 발생: 데이터가 손상되었습니다.');
    }

    final Map<String, dynamic>? data = currentData.data();
    if (data == null || !data.containsKey('supplies')) {
      throw Exception('에러 발생: 데이터가 손상되었습니다.');
    }

    List<dynamic> supplies = data['supplies'];
    if(availableAmount[suppliesNum] != null) {
      availableAmount[suppliesNum] = (availableAmount[suppliesNum]??0)+applicationRentAmount[applicationNum];
      supplies[suppliesNum]['availableAmount'] = availableAmount[suppliesNum];
    }
    applicationRentAmount.removeAt(applicationNum);
    applicationSuppliesName.removeAt(applicationNum);
    applicationUserName.removeAt(applicationNum);
    applicationRentReason.removeAt(applicationNum);
    applicationRentState.removeAt(applicationNum);


    await documentSnapshot.update({
      'supplies': supplies,
      "applicationList": FieldValue.arrayRemove([removedApplication])
    });
  }

  Future<void> updateRentState(int applicationNum, String newRentState) async {
    final applicationName = applicationSuppliesName[applicationNum];
    final suppliesNum = name.indexOf(applicationName);
    if(suppliesNum == -1) {
      throw Exception('에러 발생: 데이터가 손상되었습니다.');
    }

    final documentSnapshot = firestore.collection(schoolName).doc(suppliesRoom);
    final currentData = await documentSnapshot.get();

    if (!currentData.exists) {
      throw Exception('에러 발생: 데이터가 손상되었습니다.');
    }

    final Map<String, dynamic>? data = currentData.data();
    if (data == null || !data.containsKey('applicationList')) {
      throw Exception('에러 발생: 데이터가 손상되었습니다.');
    }

    List<dynamic> applicationList = data['applicationList'];

    if (applicationList.isNotEmpty && applicationNum >= 0 && applicationNum < applicationList.length) {
      applicationList[applicationNum]['rentState'] = newRentState;

      await documentSnapshot.update({
        'applicationList': applicationList,
      });
      applicationRentState[applicationNum] = newRentState;
    } else {
      throw Exception('에러 발생: 해당 애플리케이션을 찾을 수 없습니다.');
    }
  }


/*Future<void> sendUpdateData() async{
    final documentSnapshot = firestore.collection(schoolName).doc(suppliesRoom);
    List<dynamic> applicationList = data['applicationList'];

    List<dynamic> supplies = data['supplies'];
    supplies[suppliesNum]['availableAmount'] = availableAmount[suppliesNum];


    await documentSnapshot.update({'applicationList': applicationList, 'supplies': supplies});
  }*/
}

