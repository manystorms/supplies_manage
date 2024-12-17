import 'package:firebase_core/firebase_core.dart';
import 'package:supplies_manage/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';
import 'package:supplies_manage/model/supplies_room_data.dart';
import 'package:supplies_manage/model/manage_supplies_data.dart';

late ManageSuppliesData manageSuppliesDataInfo;

void test() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //createAccount('aaaa@gmail.com', '111111');

  await signInWithEmail('aaaa@gmail.com', '111111');

  late SuppliesRoomData suppliesRoomInfo;

  suppliesRoomInfo = await SuppliesRoomData.getData('물리준비실', 'supplies');
  manageSuppliesDataInfo = await ManageSuppliesData.getData('물리준비실', 'supplies');
  //await suppliesRoomInfo.rentSupplies(1, 2, 'bb');
  //await suppliesRoomInfo.inputData('aa', 3, true);
  print(suppliesRoomInfo.name);
  print(suppliesRoomInfo.amount);
  print(suppliesRoomInfo.availableAmount);
  print(suppliesRoomInfo.location);
  print(suppliesRoomInfo.consumable);
  print(suppliesRoomInfo.imageUrl);
  print(suppliesRoomInfo.applicationUserName);
  print(suppliesRoomInfo.applicationSuppliesName);
  print(suppliesRoomInfo.applicationRentAmount);


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
              const Text(
                'Network Image',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20), // 간격 추가
              ElevatedButton(
                onPressed: () {
                  manageSuppliesDataInfo.inputImageData(0);
                },
                child: const Text("Press Me"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}