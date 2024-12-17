import '/flutter_flow/flutter_flow_util.dart';
import 'mainpage_widget.dart' show MainpageWidget;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supplies_manage/show_alert.dart';
import 'package:flutter/material.dart';

class MainpageModel extends FlutterFlowModel<MainpageWidget> {
  Future<void> logOutButtonPressed(BuildContext context) async{
    try{
      await FirebaseAuth.instance.signOut();
      if(context.mounted) await showAlertWithoutChoice(context, '로그아웃되었습니다');
    }catch(e){
      if(context.mounted) await showAlertWithoutChoice(context, '에러 발생: 로그아웃 실패');
    }
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
