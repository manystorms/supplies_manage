import '/flutter_flow/flutter_flow_util.dart';
import 'loginpage_widget.dart'
    show LoginPageWidget;
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';
import 'package:supplies_manage/show_alert.dart';

class LoginCreateAccountPageModel
    extends FlutterFlowModel<LoginPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode;
  TextEditingController? emailAddressCreateTextController;
  String? Function(BuildContext, String?)?
  emailAddressCreateTextControllerValidator;
  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode;
  TextEditingController? passwordCreateTextController;
  late bool passwordCreateVisibility;
  String? Function(BuildContext, String?)?
  passwordCreateTextControllerValidator;
  // State field(s) for password_CreateConfirm widget.
  FocusNode? passwordCreateConfirmFocusNode;
  TextEditingController? passwordCreateConfirmTextController;
  late bool passwordCreateConfirmVisibility;
  String? Function(BuildContext, String?)?
  passwordCreateConfirmTextControllerValidator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  Future<bool> createAccountSuccess(BuildContext context) async {
    try{
      if(passwordCreateTextController.text != passwordCreateConfirmTextController.text) {
        showAlertWithoutChoice(context, '입력한 비밀번호가 일치하지 않습니다');
        return false;
      }

      await createAccount(emailAddressCreateTextController.text, passwordCreateTextController.text);
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
          case 'email-already-in-use':
            showAlertWithoutChoice(context, '이미 해당 계정으로 가입한 계정이 있습니다');
            break;
          case 'weak-password':
            showAlertWithoutChoice(context, '비밀번호는 6자리 이상이어야 합니다');
            break;
          default:
            showAlertWithoutChoice(context, '에러가 발생했습니다. 관리자에게 문의하세요');
        }
      }
      return false;
    } catch(e) {
      if(context.mounted) {
        showAlertWithoutChoice(context, '에러가 발생했습니다. 관리자에게 문의하세요');
      }
      return false;
    }
  }

  Future<bool> signInSuccess(BuildContext context) async {
    try{
      await signInWithEmail(emailAddressTextController.text, passwordTextController.text);
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
            showAlertWithoutChoice(context, '에러가 발생했습니다. 관리자에게 문의하세요');
        }
      }
      return false;
    }catch(e) {
      if(context.mounted) {
        showAlertWithoutChoice(context, '에러가 발생했습니다. 관리자에게 문의하세요');
      }
      return false;
    }
  }

  @override
  void initState(BuildContext context) {
    passwordCreateVisibility = false;
    passwordCreateConfirmVisibility = false;
    passwordVisibility = false;
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailAddressCreateFocusNode?.dispose();
    emailAddressCreateTextController?.dispose();

    passwordCreateFocusNode?.dispose();
    passwordCreateTextController?.dispose();

    passwordCreateConfirmFocusNode?.dispose();
    passwordCreateConfirmTextController?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
