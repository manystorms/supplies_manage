import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'delete_account_model.dart';
export 'delete_account_model.dart';

class DeleteAccountWidget extends StatefulWidget {
  const DeleteAccountWidget({super.key});

  @override
  State<DeleteAccountWidget> createState() =>
      _DeleteAccountWidgetState();
}

class _DeleteAccountWidgetState
    extends State<DeleteAccountWidget> with TickerProviderStateMixin {
  late DeleteAccountModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeleteAccountModel());

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    animationsMap.addAll({
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 300.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 300.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 20.0),
            end: const Offset(0.0, 0.0),
          ),
        ],
      ),
    });
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: (Navigator.canPop(context)) ? InkWell(
              onTap: () {
                context.pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24,
              ),
            ):null,
            title: Text(
              '계정 삭제',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Pretendard',
                letterSpacing: 0.0,
                useGoogleFonts: false,
              ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0,
          ),
        ),
        body: SafeArea(
          top: true,
          child: Align(
            alignment: const AlignmentDirectional(0, -1),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                  24, 16, 24, 0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      '계정 삭제',
                      textAlign: TextAlign.start,
                      style:
                      FlutterFlowTheme.of(context)
                          .headlineMedium
                          .override(
                        fontFamily:
                        FlutterFlowTheme.of(
                            context)
                            .headlineMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts
                            .asMap()
                            .containsKey(
                            FlutterFlowTheme.of(
                                context)
                                .headlineMediumFamily),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional
                          .fromSTEB(0, 4, 0, 24),
                      child: Text(
                        '삭제할 계정의 아이디와 비밀번호를 입력하세요',
                        textAlign: TextAlign.start,
                        style:
                        FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                          fontFamily:
                          FlutterFlowTheme.of(
                              context)
                              .labelMediumFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts
                              .asMap()
                              .containsKey(
                              FlutterFlowTheme.of(
                                  context)
                                  .labelMediumFamily),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional
                          .fromSTEB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model
                              .emailAddressTextController,
                          focusNode: _model
                              .emailAddressFocusNode,
                          autofocus: true,
                          autofillHints: const [
                            AutofillHints.email
                          ],
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: FlutterFlowTheme
                                .of(context)
                                .labelLarge
                                .override(
                              fontFamily:
                              FlutterFlowTheme.of(
                                  context)
                                  .labelLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts
                                  .asMap()
                                  .containsKey(
                                  FlutterFlowTheme.of(
                                      context)
                                      .labelLargeFamily),
                            ),
                            enabledBorder:
                            OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                FlutterFlowTheme.of(
                                    context)
                                    .alternate,
                                width: 2,
                              ),
                              borderRadius:
                              BorderRadius.circular(
                                  12),
                            ),
                            focusedBorder:
                            OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                FlutterFlowTheme.of(
                                    context)
                                    .primary,
                                width: 2,
                              ),
                              borderRadius:
                              BorderRadius.circular(
                                  12),
                            ),
                            errorBorder:
                            OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                FlutterFlowTheme.of(
                                    context)
                                    .alternate,
                                width: 2,
                              ),
                              borderRadius:
                              BorderRadius.circular(
                                  12),
                            ),
                            focusedErrorBorder:
                            OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                FlutterFlowTheme.of(
                                    context)
                                    .alternate,
                                width: 2,
                              ),
                              borderRadius:
                              BorderRadius.circular(
                                  12),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme
                                .of(context)
                                .secondaryBackground,
                            contentPadding:
                            const EdgeInsetsDirectional
                                .fromSTEB(
                                24, 24, 0, 24),
                          ),
                          style: FlutterFlowTheme.of(
                              context)
                              .bodyLarge
                              .override(
                            fontFamily:
                            FlutterFlowTheme.of(
                                context)
                                .bodyLargeFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts
                                .asMap()
                                .containsKey(
                                FlutterFlowTheme.of(
                                    context)
                                    .bodyLargeFamily),
                          ),
                          keyboardType: TextInputType
                              .emailAddress,
                          cursorColor:
                          FlutterFlowTheme.of(
                              context)
                              .primary,
                          validator: _model
                              .emailAddressTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional
                          .fromSTEB(0, 0, 0, 16),
                      child: Container(
                        width: double.infinity,
                        child: TextFormField(
                          controller: _model
                              .passwordTextController,
                          focusNode:
                          _model.passwordFocusNode,
                          autofocus: true,
                          autofillHints: const [
                            AutofillHints.password
                          ],
                          obscureText: !_model
                              .passwordVisibility,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            labelStyle: FlutterFlowTheme
                                .of(context)
                                .labelLarge
                                .override(
                              fontFamily:
                              FlutterFlowTheme.of(
                                  context)
                                  .labelLargeFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts
                                  .asMap()
                                  .containsKey(
                                  FlutterFlowTheme.of(
                                      context)
                                      .labelLargeFamily),
                            ),
                            enabledBorder:
                            OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                FlutterFlowTheme.of(
                                    context)
                                    .alternate,
                                width: 2,
                              ),
                              borderRadius:
                              BorderRadius.circular(
                                  12),
                            ),
                            focusedBorder:
                            OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                FlutterFlowTheme.of(
                                    context)
                                    .primary,
                                width: 2,
                              ),
                              borderRadius:
                              BorderRadius.circular(
                                  12),
                            ),
                            errorBorder:
                            OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                FlutterFlowTheme.of(
                                    context)
                                    .error,
                                width: 2,
                              ),
                              borderRadius:
                              BorderRadius.circular(
                                  12),
                            ),
                            focusedErrorBorder:
                            OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                FlutterFlowTheme.of(
                                    context)
                                    .error,
                                width: 2,
                              ),
                              borderRadius:
                              BorderRadius.circular(
                                  12),
                            ),
                            filled: true,
                            fillColor: FlutterFlowTheme
                                .of(context)
                                .secondaryBackground,
                            contentPadding:
                            const EdgeInsetsDirectional
                                .fromSTEB(
                                24, 24, 0, 24),
                            suffixIcon: InkWell(
                              onTap: () => safeSetState(
                                    () => _model
                                    .passwordVisibility =
                                !_model
                                    .passwordVisibility,
                              ),
                              focusNode: FocusNode(
                                  skipTraversal: true),
                              child: Icon(
                                _model.passwordVisibility
                                    ? Icons
                                    .visibility_outlined
                                    : Icons
                                    .visibility_off_outlined,
                                color:
                                FlutterFlowTheme.of(
                                    context)
                                    .secondaryText,
                                size: 24,
                              ),
                            ),
                          ),
                          style: FlutterFlowTheme.of(
                              context)
                              .bodyLarge
                              .override(
                            fontFamily:
                            FlutterFlowTheme.of(
                                context)
                                .bodyLargeFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts
                                .asMap()
                                .containsKey(
                                FlutterFlowTheme.of(
                                    context)
                                    .bodyLargeFamily),
                          ),
                          cursorColor:
                          FlutterFlowTheme.of(
                              context)
                              .primary,
                          validator: _model
                              .passwordTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Align(
                      alignment:
                      const AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional
                            .fromSTEB(0, 0, 0, 16),
                        child: FFButtonWidget(
                          onPressed: () async {
                            if(await _model.deleteAccountButtonOnTap(context) == true && context.mounted) {
                              context.push('/loginpage');
                            }
                          },
                          text: '계정 삭제',
                          options: FFButtonOptions(
                            width: 230,
                            height: 52,
                            padding:
                            const EdgeInsetsDirectional
                                .fromSTEB(
                                0, 0, 0, 0),
                            iconPadding:
                            const EdgeInsetsDirectional
                                .fromSTEB(
                                0, 0, 0, 0),
                            color: FlutterFlowTheme.of(
                                context)
                                .primary,
                            textStyle: FlutterFlowTheme
                                .of(context)
                                .titleSmall
                                .override(
                              fontFamily:
                              FlutterFlowTheme.of(
                                  context)
                                  .titleSmallFamily,
                              color: Colors.white,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts
                                  .asMap()
                                  .containsKey(
                                  FlutterFlowTheme.of(
                                      context)
                                      .titleSmallFamily),
                            ),
                            elevation: 3,
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius:
                            BorderRadius.circular(
                                12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ).animateOnPageLoad(animationsMap[
              'columnOnPageLoadAnimation2']!),
            ),
          ),
        ),
      ),
    );
  }
}
