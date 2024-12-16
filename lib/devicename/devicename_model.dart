import '/flutter_flow/flutter_flow_util.dart';
import 'devicename_widget.dart' show DevicenameWidget;
import 'package:flutter/material.dart';
import 'package:supplies_manage/devicesearch/devicesearch_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

const defaultImage = 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FwpGLY%2FbtrwzcJvegQ%2FEQ5bmLOAbh1XCNImCShY50%2Fimg.png';

class DevicenameModel extends FlutterFlowModel<DevicenameWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for CountController widget.
  int countControllerValue = 1;

  Future<void> applicationRentButtonPressed(int suppliesNum) async {
      User? user = FirebaseAuth.instance.currentUser;
      if(user == null || user.email == null) throw Exception('에러 발생: 데이터가 손상되었습니다. 관리자에게 문의하세요');
      await suppliesRoomInfo.rentSupplies(suppliesNum, 1, user.email??'');
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
