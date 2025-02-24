import '/flutter_flow/flutter_flow_util.dart';
import 'add_modify_supplies_widget.dart' show AddModifySuppliesWidget;
import 'package:flutter/material.dart';
import 'package:supplies_manage/show_alert.dart';
import 'package:supplies_manage/pages/rent_status_list/rent_status_list_model.dart';

class AddModifySuppliesModel extends FlutterFlowModel<AddModifySuppliesWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for suppliesName widget.
  FocusNode? suppliesNameFocusNode;
  TextEditingController? suppliesNameTextController;
  String? Function(BuildContext, String?)? suppliesNameTextControllerValidator;
  String? _suppliesNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Please enter an age for the patient.';
    }

    return null;
  }

  // State field(s) for checkIsInputAmount widget.
  bool checkIsInputAmountValue = true;
  // State field(s) for suppliesAmount widget.
  FocusNode? suppliesAmountFocusNode;
  TextEditingController? suppliesAmountTextController;
  String? Function(BuildContext, String?)?
  suppliesAmountTextControllerValidator;
  // State field(s) for checkConsumable widget.
  bool checkConsumableValue = false;

  Future<void> getLocationButtonOnTap(BuildContext context) async {
    context.push('/map/getLocationMode');
  }

  Future<void> uploadImageButtonOnTap(BuildContext context) async{
    try{
      await suppliesRoomInfo.getImage();
    }catch(e) {
      if(context.mounted) await showAlertWithoutChoice(context, '에러 발생: 다시 시도하세요');
    }
  }

  Future<void> completeButtonOnTap(BuildContext context) async{
    final inputSuppliesAmount = int.tryParse(suppliesAmountTextController.text);

    if(suppliesNameTextController.text.isEmpty) {
      await showAlertWithoutChoice(context, '준비물의 이름을 입력하세요');
      return;
    }else if((inputSuppliesAmount == null || inputSuppliesAmount <= 0) && checkIsInputAmountValue == true) {
      await showAlertWithoutChoice(context, '준비물의 수량은 자연수만 가능합니다');
      return;
    }

    try{
      await suppliesRoomInfo.inputData(
        suppliesNameTextController.text,
        inputSuppliesAmount,
        'asd',//location
        checkConsumableValue
      );
      if(context.mounted) context.pop();
    }catch(e) {
      if(context.mounted) await showAlertWithoutChoice(context, '에러 발생: 다시 시도해 주세요');
    }
  }

  @override
  void initState(BuildContext context) {
    suppliesNameTextControllerValidator = _suppliesNameTextControllerValidator;
  }

  @override
  void dispose() {
    suppliesNameFocusNode?.dispose();
    suppliesNameTextController?.dispose();

    suppliesAmountFocusNode?.dispose();
    suppliesAmountTextController?.dispose();
  }
}
