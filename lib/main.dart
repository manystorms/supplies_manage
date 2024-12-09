import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:supplies_manage/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';
import 'package:supplies_manage/model/supplies_room_data.dart';
import 'package:supplies_manage/model/update_supplies_data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //createAccount('aaaa@gmail.com', '111111');

  signInWithEmail('aaaa@gmail.com', '111111');

  late SuppliesRoomData suppliesRoomInfo;

  suppliesRoomInfo = await SuppliesRoomData.getData('물리준비실', 'supplies');
  await suppliesRoomInfo.rentSupplies(1, 2, SuppliesProcess.back);
  print(suppliesRoomInfo.name);
  print(suppliesRoomInfo.amount);
  print(suppliesRoomInfo.availableAmount);
  print(suppliesRoomInfo.consumable);
  print(suppliesRoomInfo.imagePath);


  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Network Image Display',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Network Image Example'),
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Network Image',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20), // 간격 추가
              ElevatedButton(
                onPressed: () {
                  UpdateSuppliesData a = UpdateSuppliesData('물리준비실', 'supplies');
                  a.uploadImage();
                },
                child: Text("Press Me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
