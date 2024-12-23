import '/flutter_flow/flutter_flow_util.dart';
import 'rent_supplies_widget.dart' show RentSuppliesWidget;
import 'package:flutter/material.dart';
import 'package:supplies_manage/pages/devicesearch/devicesearch_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DevicenameModel extends FlutterFlowModel<RentSuppliesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController textController = TextEditingController();
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for CountController widget.
  int countControllerValue = 1;

  Future<void> applicationRentButtonPressed(int suppliesNum) async {
    User? user = FirebaseAuth.instance.currentUser;
    if(user == null || user.email == null) throw Exception('에러 발생: 데이터가 손상되었습니다. 관리자에게 문의하세요');

    await suppliesRoomInfo.rentSupplies(suppliesNum, countControllerValue, user.email??'', textController.text);
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController.dispose();
  }
}
