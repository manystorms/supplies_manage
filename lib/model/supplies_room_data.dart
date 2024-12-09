import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

enum SuppliesProcess {rent, back}

class SuppliesRoomData{
  final String schoolName;
  final String suppliesRoom;
  final List<String> name;
  final List<int?> amount;
  final List<int?> availableAmount;
  final List<bool> consumable;
  final List<String?> imagePath;

  SuppliesRoomData(this.schoolName, this.suppliesRoom, this.name, this.amount,
      this.availableAmount, this.consumable, this.imagePath);

  static Future<SuppliesRoomData> getData(String schoolName, String suppliesRoom) async{
    final documentSnapshot = await firestore.collection(schoolName).doc(suppliesRoom).get();

    if (documentSnapshot.exists) {
      Map<String, dynamic>? data = documentSnapshot.data();
      if (data != null && data.containsKey('supplies')) {
        List<dynamic> supplies = data['supplies'];
        List<String> name = [];
        List<int?> amount = [];
        List<int?> availableAmount = [];
        List<bool> consumable = [];
        List<String?> imagePath = [];

        for (var supply in supplies) {
          name.add(supply['name']);
          amount.add(supply['amount']);
          availableAmount.add(supply['availableAmount']);
          consumable.add(supply['consumable'] ?? false);
          imagePath.add(supply['imagePath']);
        }

        return SuppliesRoomData(schoolName, suppliesRoom, name, amount, availableAmount, consumable, imagePath);
      } else {
        throw Exception('error');
      }
    }else{
      throw Exception('error');
    }
  }

  Future<void> rentSupplies(int suppliesNum, int processAmount, SuppliesProcess process) async {
    if(amount[suppliesNum] == null || availableAmount[suppliesNum] == null) return;

    if(process == SuppliesProcess.rent && (availableAmount[suppliesNum]??0) < processAmount) {
      throw Exception('에러 발생: 대여하려는 준비물의 수가 대여가능한 준비물의 수보다 많습니다.');
    }else if(process == SuppliesProcess.back && (availableAmount[suppliesNum]??0)+processAmount > (amount[suppliesNum]??0)) {
      throw Exception('에러 발생: 저장된 준비물 데이터가 손상되었습니다. 관리자에게 문의하세요.');
    }

    if(process == SuppliesProcess.rent && availableAmount[suppliesNum] != null) {
      availableAmount[suppliesNum] = availableAmount[suppliesNum]??0 - processAmount;
    }else if(process == SuppliesProcess.back){
      availableAmount[suppliesNum] = availableAmount[suppliesNum]??0 + processAmount;
    }

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
}

