import '/flutter_flow/flutter_flow_util.dart';
import 'mainpage_widget.dart' show MainPageWidget;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:supplies_manage/show_alert.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';
import 'package:flutter/material.dart';

class TileInfo{
  final String title;
  final String linkedPage;
  final UserRole role;

  TileInfo(this.title, this.linkedPage, this.role);
}

List<TileInfo> tile = [
  TileInfo('물품 검색', '/rentapplylist', UserRole.student),
  TileInfo('내 대여 목록', '/userrentlist', UserRole.student),
  TileInfo('계정 탈퇴', '/deleteaccount', UserRole.student),
  TileInfo('물품 추가/수정', '/rentstatuslist', UserRole.admin),
  TileInfo('대여 신청 목록', '/totalrentlist', UserRole.admin),
  TileInfo('대여/반납', '/supplieskiosk', UserRole.admin),
  TileInfo('대여/반납 기록', '/rentlog', UserRole.admin),
  TileInfo('관리자/키오스크 추가', '/adduserrole', UserRole.admin),
  TileInfo('계정 탈퇴', '/deleteaccount', UserRole.admin),
  TileInfo('대여/반납', '/supplieskiosk', UserRole.kiosk),
  TileInfo('계정 탈퇴', '/deleteaccount', UserRole.kiosk),
];

class MainPageModel extends FlutterFlowModel<MainPageWidget> {
  void logOutButtonOnTap(BuildContext context) async{
    try{
      await FirebaseAuth.instance.signOut();
      userRole = UserRole.student;
      if(context.mounted) await showAlertWithoutChoice(context, '로그아웃되었습니다');
    }catch(e){
      if(context.mounted) await showAlertWithoutChoice(context, '에러 발생: 로그아웃 실패');
    }
    if(context.mounted) context.push('/loginpage');
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
