import '/flutter_flow/flutter_flow_util.dart';
import 'add_user_role_widget.dart' show AddUserRoleWidget;
import 'package:flutter/material.dart';
import 'package:supplies_manage/show_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

class AddUserRoleModel extends FlutterFlowModel<AddUserRoleWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  String? selectedRole = '관리자';

  final List<String> option = ['관리자', '키오스크'];

  Future<void> addUserRoleButtonOnTap(BuildContext context) async {
    if(emailAddressTextController.text.isEmpty) {
      await showAlertWithoutChoice(context, 'UID를 입력하세요');
      return;
    }

    final docRef = FirebaseFirestore.instance.collection(userSchoolName).doc('authRole');

    try{
      if(selectedRole == '관리자') {
        await docRef.update({
          'adminUid':FieldValue.arrayUnion([emailAddressTextController.text])
        });
      }else if(selectedRole == '키오스크') {
        await docRef.update({
          'kioskUid':FieldValue.arrayUnion([emailAddressTextController.text])
        });
      }else{
        throw();
      }

      if(context.mounted) await showAlertWithoutChoice(context, '$selectedRole 계정 추가가 완료되었습니다');
    }catch(e) {
      if(context.mounted) await showAlertWithoutChoice(context, '에러 발생');
    }
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();
  }
}
