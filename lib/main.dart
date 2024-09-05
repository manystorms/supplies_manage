import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supplies_manage/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:supplies_manage/model/supplies_room_data.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  createAccount('aaaa@gmail.com', '111111');

  /*late SuppliesRoomData suppliesRoomInfo;

  suppliesRoomInfo = await SuppliesRoomData.getData('물리준비실', 'supplies');
  await suppliesRoomInfo.inputData('aa', 3, true);
  print(suppliesRoomInfo.name);
  print(suppliesRoomInfo.amount);
  print(suppliesRoomInfo.availableAmount);
  print(suppliesRoomInfo.consumable);*/

  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Firestore Items List"),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: firestore.collection('물리준비실').doc('supplies').get(),
        builder: (BuildContext context,
            AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Text("Error: ${snapshot.error}");
            }
            if (snapshot.hasData) {
              // 데이터 접근
              List<dynamic> items = snapshot.data!.get('supplies');
              return ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  Map<String, dynamic> item = items[index];
                  return ListTile(
                    title: Text(item['name']),
                    subtitle: Text('Amount: ${item['amount']}, Available: ${item['availableAmount']}, Consumable: ${item['consumable']}'),
                  );
                },
              );
            }
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
