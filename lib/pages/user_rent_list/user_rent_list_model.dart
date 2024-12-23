import '/flutter_flow/flutter_flow_util.dart';
import 'user_rent_list_widget.dart' show UserRentListWidget;
import 'package:flutter/material.dart';
import 'package:supplies_manage/show_alert.dart';
import 'package:supplies_manage/model/supplies_room_data.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';

late SuppliesRoomData suppliesRoomInfo;

class UserRentListModel extends FlutterFlowModel<UserRentListWidget> {
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

  Future<void> rentCancelOnTap(BuildContext context, int applicationNum) async{
    try{
      await suppliesRoomInfo.rentCancel(applicationNum);
      if(context.mounted) await showAlertWithoutChoice(context, '반납 신청이 취소되었습니다');
    }catch(e){
      if(context.mounted) await showAlertWithoutChoice(context, '에러 발생: 반납 신청이 되지 않았습니다\n다시 시도하세요');
    }
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
