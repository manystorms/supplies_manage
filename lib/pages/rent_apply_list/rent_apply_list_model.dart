import '/flutter_flow/flutter_flow_util.dart';
import 'rent_apply_list_widget.dart' show RentApplyListWidget;
import 'package:flutter/material.dart';
import 'package:supplies_manage/model/supplies_room_data.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';
import 'package:supplies_manage/show_alert.dart';

late SuppliesRoomData suppliesRoomInfo;

class RentApplyListModel extends FlutterFlowModel<RentApplyListWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;

  bool getSuppliesData = false;
  String? searchTarget;

  Future<void> getSuppliesRoomData() async{
    suppliesRoomInfo = await SuppliesRoomData.getData(userSchoolName, userSuppliesRoom);
  }

  Future<void> showMapButtonOnTap(BuildContext context, int index) async {
    if(suppliesRoomInfo.location[index] == null) {
      await showAlertWithoutChoice(context, '위치 정보가 없습니다');
    }else{
      await context.push('/map/${suppliesRoomInfo.location[index]??'0-0-0'}');
    }
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();
  }
}
