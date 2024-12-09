import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class SuppliesRoomData{
  final String schoolName;
  final String suppliesRoom;
  final List<String> name;
  final List<int?> amount;
  final List<int?> availableAmount;
  final List<String?> location;
  final List<bool> consumable;
  final List<int> imageNum;

  SuppliesRoomData(this.schoolName, this.suppliesRoom, this.name, this.amount,
      this.availableAmount, this.location, this.consumable, this.imageNum);

  static Future<SuppliesRoomData> getData(String schoolName, String suppliesRoom) async{
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

        for (var supply in supplies) {
          name.add(supply['name']);
          amount.add(supply['amount']);
          availableAmount.add(supply['availableAmount']);
          location.add(supply['location']);
          consumable.add(supply['consumable'] ?? false);
          imageNum.add(supply['imageNum']);
        }

        return SuppliesRoomData(schoolName, suppliesRoom, name, amount, availableAmount, location, consumable, imageNum);
      } else {
        throw Exception('error');
      }
    }else{
      throw Exception('error');
    }
  }

  Future<void> rentSupplies(int suppliesNum, int rentAmount) async {
    if(amount[suppliesNum] == null || availableAmount[suppliesNum] == null) return;

    if((availableAmount[suppliesNum]??0) < rentAmount) {
      throw Exception('에러 발생: 대여하려는 준비물의 수가 대여가능한 준비물의 수보다 많습니다.');
    }

    availableAmount[suppliesNum] = availableAmount[suppliesNum]??0 - rentAmount;

    final documentSnapshot = firestore.collection(schoolName).doc(suppliesRoom);

    final currentData = await documentSnapshot.get();
    if(currentData.exists) {
      Map<String, dynamic>? data = currentData.data();
      if(data != null && data.containsKey('supplies')) {
        List<dynamic> supplies = data['supplies'];
        supplies[suppliesNum]['availableAmount'] = availableAmount[suppliesNum];
        await documentSnapshot.update({'supplies': supplies});
      }else{
        throw Exception('에러 발생: 데이터가 손상되었습니다. 관리자에게 문의하세요.');
      }
    }
  }

  Future<void> rentCancel() async {

  }
}

