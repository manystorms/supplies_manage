import '/flutter_flow/flutter_flow_util.dart';
import 'delete_account_widget.dart'
    show DeleteAccountWidget;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';
import 'package:supplies_manage/show_alert.dart';

class DeleteAccountModel
    extends FlutterFlowModel<DeleteAccountWidget> {
  ///  State fields for stateful widgets in this page.
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  Future<bool> deleteAccountButtonOnTap(BuildContext context) async {
    if(await showAlertWithTwoChoice(context, '정말로 계정을 삭제하시겠습니까?', '예', '아니오') != true) return false;

    try{
      await deleteAccount(emailAddressTextController.text, passwordTextController.text);
      if(context.mounted) {
        await showAlertWithoutChoice(context, '계정 삭제를 완료했습니다');
      }
      return true;
    } on FirebaseAuthException catch (e) {
      if(context.mounted) {
        switch (e.code) {
          case 'invalid-email':
            showAlertWithoutChoice(context, '잘못된 이메일 형식입니다');
            break;
          case 'user-not-found' || 'wrong-password' || 'invalid-credential':
            showAlertWithoutChoice(context, '이메일 혹은 비밀번호가 일치하지 않습니다');
            break;
          case 'missing-password':
            showAlertWithoutChoice(context, '비밀번호를 입력하세요');
            break;
          case 'user-disabled':
            showAlertWithoutChoice(context, '해당 계정이 비활성화 상태입니다');
            break;
          default:
            debugPrint(e.toString());
            showAlertWithoutChoice(context, '에러가 발생했습니다. 관리자에게 문의하세요');
        }
      }
      return false;
    }catch(e) {
      if(context.mounted) {
        debugPrint(e.toString());
        showAlertWithoutChoice(context, '에러가 발생했습니다. 관리자에게 문의하세요');
      }
      return false;
    }
  }

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
