import '/flutter_flow/flutter_flow_util.dart';
import 'supplies_kiosk_widget.dart' show SuppliesKioskWidget;
import 'package:flutter/material.dart';
import 'package:supplies_manage/model/supplies_room_data.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';

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

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();

    tabBarController?.dispose();
  }
}
