import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class SuppliesRoomData{
  final String schoolName;
  final String suppliesRoom;
  final List<String> name;
  final List<int> amount;
  final List<int> availableAmount;
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
        List<int> amount = [];
        List<int> availableAmount = [];
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

  Future<void> inputData(String inputName, int inputAmount, bool inputConsumable) async{
    final documentSnapshot = firestore.collection(schoolName).doc(suppliesRoom);

    final Map<String, dynamic> inputSuppliesData = {
      'name': inputName,
      'amount': inputAmount,
      'availableAmount': inputAmount,
      'consumable': inputConsumable
    };

    name.add(inputName);
    amount.add(inputAmount);
    availableAmount.add(inputAmount);
    consumable.add(inputConsumable);
    imagePath.add(null);

    await documentSnapshot.update({
      'supplies': FieldValue.arrayUnion([inputSuppliesData])
    });
  }

  Future<void> rentSupplies(int suppliesNum, int rentAmount) async {

  }
}

