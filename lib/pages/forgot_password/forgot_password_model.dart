import '/flutter_flow/flutter_flow_util.dart';
import 'forgot_password_widget.dart' show ForgotPasswordWidget;
import 'package:flutter/material.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';
import 'package:supplies_manage/show_alert.dart';

class ForgotPasswordModel extends FlutterFlowModel<ForgotPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;

  Future<void> sendLinkButtonOnTap(BuildContext context) async {
    if(emailAddressTextController.text.isEmpty) {
      await showAlertWithoutChoice(context, '이메일 주소를 입력하세요');
    }

    try{
      await sendResetPasswordLink(emailAddressTextController.text);
      if(context.mounted) await showAlertWithoutChoice(context, '해당 이메일로 비밀번호 초기화 링크를 보냈습니다');
    }catch(e) {
      if(context.mounted) await showAlertWithoutChoice(context, e.toString());
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
