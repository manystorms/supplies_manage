import '/flutter_flow/flutter_flow_util.dart';
import 'rent_status_list_widget.dart' show RentStatusListWidget;
import 'package:flutter/material.dart';
import 'package:supplies_manage/model/manage_supplies_data.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';

late ManageSuppliesData suppliesRoomInfo;

class RentApplyListModel extends FlutterFlowModel<RentStatusListWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;

  bool getSuppliesData = false;
  String? searchTarget;

  bool checkIsInputAmountValue = true;
  FocusNode? suppliesAmountFocusNode;
  TextEditingController? suppliesAmountTextController;
  String? Function(BuildContext, String?)?
  suppliesAmountTextControllerValidator;

  Future<void> getSuppliesRoomData() async{
    suppliesRoomInfo = await ManageSuppliesData.getData(userSchoolName, userSuppliesRoom);
  }

  bool isSearchTargetSupplies(int index) {
    if(searchTarget == null || suppliesRoomInfo.name[index].contains(searchTarget??'')) {
      return true;
    }else{
      return false;
    }
  }

  Future<void> addModifySuppliesButtonOnTap(BuildContext context) async {
    await context.push('/addmodifysupplies');
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();
  }
}