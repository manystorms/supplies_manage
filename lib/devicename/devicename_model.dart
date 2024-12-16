import '/flutter_flow/flutter_flow_util.dart';
import 'devicename_widget.dart' show DevicenameWidget;
import 'package:flutter/material.dart';

const defaultImage = 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FwpGLY%2FbtrwzcJvegQ%2FEQ5bmLOAbh1XCNImCShY50%2Fimg.png';

class DevicenameModel extends FlutterFlowModel<DevicenameWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for CountController widget.
  int? countControllerValue;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
