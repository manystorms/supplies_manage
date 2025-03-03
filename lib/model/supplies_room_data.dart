import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';
import 'package:uuid/uuid.dart';
import 'package:ntp/ntp.dart';

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
  final List<String> applicationRentId;

  SuppliesRoomData(this.schoolName, this.suppliesRoom, this.name, this.amount, this.availableAmount, this.location, this.consumable, this.imageUrl,
      this.applicationUserName, this.applicationSuppliesName, this.applicationRentAmount, this.applicationRentReason, this.applicationRentState, this.applicationRentId);

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

      return SuppliesRoomData(schoolName, suppliesRoom, name, amount, availableAmount, location, consumable,
          imageUrl, applicationUserName, applicationSuppliesName, applicationRentAmount, applicationRentReason, applicationRentState, applicationRentId);
    }
    throw Exception('에러 발생: 데이터가 손상되었습니다.');
  }

  Future<void> rentSupplies(String suppliesName, int? rentAmount, String userName, String rentReason) async {
    var uuid = const Uuid();
    final rentId = uuid.v4();
    final documentSnapshot = firestore.collection(schoolName).doc(suppliesRoom);
    String todayDate = await getTodayDate();

    await firestore.runTransaction((transaction) async {
      final currentData = await transaction.get(documentSnapshot);

      if(!currentData.exists) throw ('에러 발생: 데이터가 손상되었습니다');

      Map<String, dynamic>? data = currentData.data();
      if(data == null) throw ('에러 발생: 데이터가 손상되었습니다');

      List<dynamic> supplies = data['supplies'] ?? [];
      List<dynamic> applicationList = data['applicationList'] ?? [];

      int suppliesNum = supplies.indexWhere((item) => item['name'] == suppliesName);

      if(supplies[suppliesNum]['availableAmount'] != null && supplies[suppliesNum]['availableAmount'] < rentAmount) throw ('rentAmountTooMuch');

      if (rentReason == '') {
        applicationList.add({
          'userName': userName,
          'suppliesName': suppliesName,
          'rentAmount': rentAmount,
          'rentState': '대여 신청',
          'rentId': rentId,
          'rentDate': todayDate
        });
      } else {
        applicationList.add({
          'userName': userName,
          'suppliesName': suppliesName,
          'rentAmount': rentAmount,
          'rentReason': rentReason,
          'rentState': '대여 신청',
          'rentId': rentId,
          'rentData': todayDate
        });
      }

      if(supplies[suppliesNum]['availableAmount'] != null) {
        supplies[suppliesNum]['availableAmount'] =
            (supplies[suppliesNum]['availableAmount'] ?? 0) - rentAmount;
        availableAmount[suppliesNum] = supplies[suppliesNum]['availableAmount'];
      }

      transaction.update(documentSnapshot, {
        'applicationList': applicationList,
        'supplies': supplies,
      });

      DocumentReference logRef = documentSnapshot.collection('log').doc(logDocumentName(todayDate));
      DocumentSnapshot logSnapshot = await transaction.get(logRef);

      final Map<String, dynamic> log = {
        'date': todayDate,
        'rentPerson': userName,
        'suppliesName': suppliesName,
        'rentAmount': rentAmount,
        'returnComplete': false,
        'rentId': rentId
      };

      if(!logSnapshot.exists) {
        transaction.set(logRef, {
          'log': log
        });
      }else{
        List<dynamic> logList = List.from(logSnapshot['log'] ?? []);
        logList.add(log);

        transaction.update(logRef, {'log': logList});
      }
    });
  }

  Future<void> rentCancel(String rentId) async {
    final documentSnapshot = firestore.collection(schoolName).doc(suppliesRoom);

    await firestore.runTransaction((transaction) async {
      final currentData = await transaction.get(documentSnapshot);

      if(!currentData.exists) throw ('에러 발생: 데이터가 손상되었습니다');

      Map<String, dynamic>? data = currentData.data();
      if(data == null) throw ('에러 발생: 데이터가 손상되었습니다');

      List<dynamic> supplies = data['supplies'] ?? [];
      List<dynamic> applicationList = data['applicationList'] ?? [];

      int applicationNum = applicationList.indexWhere((item) => item['rentId'] == rentId);
      if(applicationNum == -1) throw('에러 발생: application 데이터 손상');
      int suppliesNum = supplies.indexWhere((item) => item['name'] == applicationList[applicationNum]['suppliesName']);
      if(suppliesNum == -1) throw('에러 발생: supplies 데이터 손상');

      if(supplies[suppliesNum]['availableAmount'] != null) {
        supplies[suppliesNum]['availableAmount'] =
            supplies[suppliesNum]['availableAmount']+applicationList[applicationNum]['rentAmount'];
      }

      applicationList.removeAt(applicationNum);

      transaction.update(documentSnapshot, {
        'applicationList': applicationList,
        'supplies': supplies,
      });
    });

    int applicationNum = applicationRentId.indexOf(rentId);
    applicationUserName.removeAt(applicationNum);
    applicationSuppliesName.removeAt(applicationNum);
    applicationRentAmount.removeAt(applicationNum);
    applicationRentReason.removeAt(applicationNum);
    applicationRentState.removeAt(applicationNum);
    applicationRentId.removeAt(applicationNum);
  }

  Future<void> updateRentState(String rentId, String newRentState) async {
    final documentSnapshot = firestore.collection(schoolName).doc(suppliesRoom);

    await firestore.runTransaction((transaction) async {
      final currentData = await transaction.get(documentSnapshot);

      if(!currentData.exists) throw ('에러 발생: 데이터가 손상되었습니다');

      Map<String, dynamic>? data = currentData.data();
      if(data == null) throw ('에러 발생: 데이터가 손상되었습니다');
      List<dynamic> applicationList = data['applicationList'] ?? [];

      int applicationNum = applicationList.indexWhere((item) => item['rentId'] == rentId);
      if(applicationNum == -1) throw('에러 발생: application 데이터 손상');

      applicationList[applicationNum]['rentState'] = newRentState;
      applicationRentState[applicationRentId.indexOf(rentId)] = newRentState;

      transaction.update(documentSnapshot, {
        'applicationList': applicationList,
      });
    });
  }

  Future<String> getTodayDate() async{
    DateTime now = DateTime.now();//await NTP.now();
    return '${now.year}-${now.month}-${now.day}';
  }

  String logDocumentName(String date) {
    final List<String> dateParts = date.split('-');
    return dateParts[0]+dateParts[1].padLeft(2, '0');
  }
}