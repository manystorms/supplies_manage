import '/flutter_flow/flutter_flow_util.dart';
import 'rent_log_widget.dart' show RentLogWidget;
import 'package:flutter/material.dart';
import 'package:supplies_manage/model/manage_supplies_data.dart';
import 'package:supplies_manage/show_alert.dart';

late ManageSuppliesData suppliesRoomInfo;

const int startYear = 2020;

class RentLogModel extends FlutterFlowModel<RentLogWidget> {
  bool getLogData = true;
  int selectedYear = DateTime.now().year;
  int selectedMonth = DateTime.now().month;
  final List<int> years = List.generate(DateTime.now().year - startYear + 1, (index) => startYear + index);
  final List<int> months = List.generate(12, (index) =>index+1);
  List<Map<String, dynamic>> logData = [];
  
  Future<void> getRentLogButtonOnTap(BuildContext context) async{
    if(getLogData == false) return;

    try{
      getLogData = false;
      logData = await getRentLog(selectedYear, selectedMonth);
      getLogData = true;
    }catch(e) {
      if(context.mounted) {
        if(e.toString() == 'noLogData') {
          showAlertWithoutChoice(context, '해당 기간에 데이터가 없습니다');
        }else{
          showAlertWithoutChoice(context, '에러 발생');
        }
      }
      getLogData = true;
    }
  }

  String getImageUrl(int applicationNum) {
    final applicationName = suppliesRoomInfo.applicationSuppliesName[applicationNum];
    final suppliesNum = suppliesRoomInfo.name.indexOf(applicationName);
    return suppliesRoomInfo.imageUrl[suppliesNum];
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
