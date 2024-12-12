import '/flutter_flow/flutter_flow_util.dart';
import 'devicesearch_widget.dart' show DevicesearchWidget;
import 'package:flutter/material.dart';
import 'package:supplies_manage/model/supplies_room_data.dart';
import 'package:supplies_manage/model/user_data.dart';

class DevicesearchModel extends FlutterFlowModel<DevicesearchWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for searchBar widget.
  FocusNode? searchBarFocusNode;
  TextEditingController? searchBarTextController;
  String? Function(BuildContext, String?)? searchBarTextControllerValidator;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  late SuppliesRoomData suppliesRoomInfo;

  Future<void> getSuppliesRoomData() async{
    suppliesRoomInfo = await SuppliesRoomData.getData(schoolName, suppliesRoom);
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    searchBarFocusNode?.dispose();
    searchBarTextController?.dispose();

    tabBarController?.dispose();
  }
}
