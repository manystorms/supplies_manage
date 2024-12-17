import '/flutter_flow/flutter_flow_util.dart';
import 'borrowlabel_widget.dart' show BorrowlabelWidget;
import 'package:flutter/material.dart';
import 'package:supplies_manage/model/supplies_room_data.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';

late SuppliesRoomData suppliesRoomInfo;

class BorrowlabelModel extends FlutterFlowModel<BorrowlabelWidget> {
  ///  State fields for stateful widgets in this page.

  bool getSuppliesData = false;

  Future<void> getSuppliesRoomData() async{
    suppliesRoomInfo = await SuppliesRoomData.getData(userSchoolName, userSuppliesRoom);
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
