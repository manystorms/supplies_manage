import '/flutter_flow/flutter_flow_util.dart';
import 'add_modify_supplies_widget.dart' show AddModifySuppliesWidget;
import 'package:flutter/material.dart';

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
  bool? checkIsInputAmountValue;
  // State field(s) for suppliesAmount widget.
  FocusNode? suppliesAmountFocusNode;
  TextEditingController? suppliesAmountTextController;
  String? Function(BuildContext, String?)?
  suppliesAmountTextControllerValidator;
  // State field(s) for checkConsumable widget.
  bool? checkConsumableValue;

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
