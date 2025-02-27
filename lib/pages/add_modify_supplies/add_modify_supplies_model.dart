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

  bool addMode = false;

  // State field(s) for checkIsInputAmount widget.
  bool checkIsInputAmountValue = true;
  // State field(s) for suppliesAmount widget.
  FocusNode? suppliesAmountFocusNode;
  TextEditingController? suppliesAmountTextController;
  String? Function(BuildContext, String?)?
  suppliesAmountTextControllerValidator;
  // State field(s) for checkConsumable widget.
  bool checkConsumableValue = false;
  String? location;

  Future<void> getLocationButtonOnTap(BuildContext context) async {
    location = await context.push('/map/getLocationMode');
  }

  Future<void> uploadImageButtonOnTap(BuildContext context) async{
    try{
      await suppliesRoomInfo.getImage();
    }catch(e) {
      if(context.mounted) await showAlertWithoutChoice(context, '에러 발생: 다시 시도하세요');
    }
  }

  Future<void> addSuppliesButtonOnTap(BuildContext context) async{
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
          (checkIsInputAmountValue)? inputSuppliesAmount:null,
        location,
        checkConsumableValue
      );
      if(context.mounted) context.pop();
    }catch(e) {
      if(context.mounted) {
        if(e.toString() == 'duplicationName') {
          await showAlertWithoutChoice(context, '이미 해당 이름의 준비물이 있습니다');
        }else{
          await showAlertWithoutChoice(context, '에러 발생: 다시 시도해 주세요');
        }
      }
    }
  }

  Future<void> modifySuppliesButtonOnTap(BuildContext context, String suppliesName) async {
    final inputSuppliesAmount = int.tryParse(suppliesAmountTextController.text);

    if((inputSuppliesAmount == null || inputSuppliesAmount <= 0) && checkIsInputAmountValue == true) {
      await showAlertWithoutChoice(context, '준비물의 수량은 자연수만 가능합니다');
      return;
    }

    try{
      await suppliesRoomInfo.modifyData(
          suppliesName,
          (checkIsInputAmountValue)? inputSuppliesAmount:null,
          location,
          checkConsumableValue
      );
      if(context.mounted) context.pop();
    }catch(e) {
      debugPrint(e.toString());
      if(context.mounted) {
        if(e.toString() == 'wrongAmount') {
          await showAlertWithoutChoice(context, '입력한 개수보다 많은 물품이 현재 대여중 혹은 대여 신청 상태입니다');
        }else{
          await showAlertWithoutChoice(context, '에러 발생: 다시 시도해 주세요');
        }
      }
    }
  }

  Future<bool> removeSuppliesButtonOnTap(BuildContext context, String suppliesName) async {
    if(await showAlertWithTwoChoice(context, '삭제하시겠습니까?', '예', '아니오') == true) {
      try{
        await suppliesRoomInfo.removeData(suppliesName);
        return true;
      }catch(e) {
        if(context.mounted) await showAlertWithoutChoice(context, '에러 발생: 다시 시도해 주세요');
      }
    }
    return false;
  }

  @override
  void initState(BuildContext context) {
    suppliesRoomInfo.imageFile = null;

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
