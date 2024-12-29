import '/flutter_flow/flutter_flow_util.dart';
import 'total_rent_list_widget.dart' show TotalRentListWidget;
import 'package:flutter/material.dart';
import 'package:supplies_manage/model/supplies_room_data.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';

late SuppliesRoomData suppliesRoomInfo;

class UserRentListModel extends FlutterFlowModel<TotalRentListWidget> {
  ///  State fields for stateful widgets in this page.

  bool getSuppliesData = false;

  Future<void> getSuppliesRoomData() async{
    suppliesRoomInfo = await SuppliesRoomData.getData(userSchoolName, userSuppliesRoom);
  }

  String getImageUrl(int applicationNum) {
    final applicationName = suppliesRoomInfo.applicationSuppliesName[applicationNum];
    final suppliesNum = suppliesRoomInfo.name.indexOf(applicationName);
    return suppliesRoomInfo.imageUrl[suppliesNum];
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
