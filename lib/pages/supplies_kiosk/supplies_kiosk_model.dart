import '/flutter_flow/flutter_flow_util.dart';
import 'supplies_kiosk_widget.dart' show SuppliesKioskWidget;
import 'package:flutter/material.dart';
import 'package:supplies_manage/model/supplies_room_data.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';
import 'package:supplies_manage/show_alert.dart';

late SuppliesRoomData suppliesRoomInfo;

class SuppliesKioskModel extends FlutterFlowModel<SuppliesKioskWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  bool getSuppliesData = false;

  Future<void> getSuppliesRoomData() async{
    suppliesRoomInfo = await SuppliesRoomData.getData(userSchoolName, userSuppliesRoom);
  }

  String getImageUrl(int applicationNum) {
    final applicationName = suppliesRoomInfo.applicationSuppliesName[applicationNum];
    final suppliesNum = suppliesRoomInfo.name.indexOf(applicationName);
    return suppliesRoomInfo.imageUrl[suppliesNum];
  }

  Future<void> rentButtonOnTap(BuildContext context, int applicationNum) async{
    bool? checkIsReallyReturn = await showAlertWithTwoChoice(context, '대여하시겠습니까?', '예', '아니오');
    if(checkIsReallyReturn == null || checkIsReallyReturn == false) return;

    try{
      await suppliesRoomInfo.updateRentState(applicationNum, '대여 중');
    }catch(e) {
      if(context.mounted) await showAlertWithoutChoice(context, '에러가 발생했습니다');
    }
  }

  Future<void> returnButtonOnTap(BuildContext context, int applicationNum) async {
    bool? checkIsReallyReturn = await showAlertWithTwoChoice(context, '반납하시겠습니까?', '예', '아니오');
    if(checkIsReallyReturn == null || checkIsReallyReturn == false) return;

    try{
      await suppliesRoomInfo.rentCancel(suppliesRoomInfo.applicationRentId[applicationNum]);
    }catch(e) {
      if(context.mounted) await showAlertWithoutChoice(context, '에러가 발생했습니다');
    }
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();

    tabBarController?.dispose();
  }
}
