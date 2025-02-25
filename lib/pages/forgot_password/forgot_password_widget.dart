import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';

import 'forgot_password_model.dart';
export 'forgot_password_model.dart';

class ForgotPasswordWidget extends StatefulWidget {
  const ForgotPasswordWidget({super.key});

  static String routeName = 'ForgotPassword';
  static String routePath = '/forgotPassword';

  @override
  State<ForgotPasswordWidget> createState() => _ForgotPasswordWidgetState();
}

class _ForgotPasswordWidgetState extends State<ForgotPasswordWidget> {
  late ForgotPasswordModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ForgotPasswordModel());

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.arrow_back_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () {
            context.pop();
          },
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0,
      ),
      body: Align(
        alignment: const AlignmentDirectional(0, -1),
        child: Container(
          width: double.infinity,
          constraints: const BoxConstraints(
            maxWidth: 570,
          ),
          decoration: const BoxDecoration(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (responsiveVisibility(
                context: context,
                phone: false,
                tablet: false,
              ))
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                child: Text(
                  'Forgot Password',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Pretendard',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 8, 16, 16),
                child: Text(
                  '비밀번호를 잊으셨나요?\n이메일 주소를 입력하고 비밀번호를 초기화하세요. ',
                  style: FlutterFlowTheme.of(context).labelMedium.override(
                    fontFamily: 'Pretendard',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 16, 0),
                child: Container(
                  width: double.infinity,
                  child: TextFormField(
                    controller: _model.emailAddressTextController,
                    focusNode: _model.emailAddressFocusNode,
                    autofillHints: const [AutofillHints.email],
                    obscureText: false,
                    decoration: InputDecoration(
                      labelStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Pretendard',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                      hintText: 'Email',
                      hintStyle:
                      FlutterFlowTheme.of(context).labelMedium.override(
                        fontFamily: 'Pretendard',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).alternate,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor:
                      FlutterFlowTheme.of(context).secondaryBackground,
                      contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                    ),
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      fontFamily: 'Pretendard',
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
                    maxLines: null,
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: FlutterFlowTheme.of(context).primary,
                    validator: _model.emailAddressTextControllerValidator
                        .asValidator(context),
                  ),
                ),
              ),
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(16, 24, 16, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      await _model.sendLinkButtonOnTap(context);
                    },
                    text: '이메일로 링크 보내기',
                    options: FFButtonOptions(
                      width: double.infinity,
                      height: 50,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle:
                      FlutterFlowTheme.of(context).titleSmall.override(
                        fontFamily: 'Pretendard',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                      elevation: 3,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
