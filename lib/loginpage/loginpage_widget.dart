import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

import 'loginpage_model.dart';
export 'loginpage_model.dart';

class LoginPageWidget extends StatefulWidget {
  const LoginPageWidget({super.key});

  @override
  State<LoginPageWidget> createState() =>
      _LoginCreateAccountPageWidgetState();
}

class _LoginCreateAccountPageWidgetState
    extends State<LoginPageWidget> with TickerProviderStateMixin {
  late LoginCreateAccountPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginCreateAccountPageModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    _model.emailAddressCreateTextController ??= TextEditingController();
    _model.emailAddressCreateFocusNode ??= FocusNode();

    _model.passwordCreateTextController ??= TextEditingController();
    _model.passwordCreateFocusNode ??= FocusNode();

    _model.passwordCreateConfirmTextController ??= TextEditingController();
    _model.passwordCreateConfirmFocusNode ??= FocusNode();

    _model.emailAddressTextController ??= TextEditingController();
    _model.emailAddressFocusNode ??= FocusNode();

    _model.passwordTextController ??= TextEditingController();
    _model.passwordFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.0, 80.0),
            end: const  Offset(0.0, 0.0),
          ),
          ScaleEffect(
            curve: Curves.easeInOut,
            delay: 150.0.ms,
            duration: 400.0.ms,
            begin: const Offset(0.8, 0.8),
            end: const Offset(1.0, 1.0),
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
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
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                padding: const  EdgeInsetsDirectional.fromSTEB(0, 32, 0, 16),
                child: Text(
                  '물리 준비실 \n물품 대여 프로그램',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                    fontFamily:
                    FlutterFlowTheme.of(context).displaySmallFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts: GoogleFonts.asMap().containsKey(
                        FlutterFlowTheme.of(context).displaySmallFamily),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 0, 12),
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.sizeOf(context).height * 0.8,
                      constraints: const BoxConstraints(
                        maxWidth: 530,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: Column(
                          children: [
                            Expanded(
                              child: TabBarView(
                                controller: _model.tabBarController,
                                children: [
                                  Align(
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
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                            ))
                                              Container(
                                                width: 230,
                                                height: 16,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                            Text(
                                              '회원가입',
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
                                                '물리실 물품을 손쉽게 관리하고\n편하게 대여할 수 있도록 개발한 프로그램',
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
                                                      .emailAddressCreateTextController,
                                                  focusNode: _model
                                                      .emailAddressCreateFocusNode,
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
                                                    const EdgeInsets.all(24),
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
                                                      .emailAddressCreateTextControllerValidator
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
                                                      .passwordCreateTextController,
                                                  focusNode: _model
                                                      .passwordCreateFocusNode,
                                                  autofocus: true,
                                                  autofillHints: const [
                                                    AutofillHints.password
                                                  ],
                                                  obscureText: !_model
                                                      .passwordCreateVisibility,
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
                                                    const EdgeInsets.all(24),
                                                    suffixIcon: InkWell(
                                                      onTap: () => safeSetState(
                                                            () => _model
                                                            .passwordCreateVisibility =
                                                        !_model
                                                            .passwordCreateVisibility,
                                                      ),
                                                      focusNode: FocusNode(
                                                          skipTraversal: true),
                                                      child: Icon(
                                                        _model.passwordCreateVisibility
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
                                                      .passwordCreateTextControllerValidator
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
                                                      .passwordCreateConfirmTextController,
                                                  focusNode: _model
                                                      .passwordCreateConfirmFocusNode,
                                                  autofocus: true,
                                                  autofillHints: const [
                                                    AutofillHints.password
                                                  ],
                                                  obscureText: !_model
                                                      .passwordCreateConfirmVisibility,
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
                                                    const EdgeInsets.all(24),
                                                    suffixIcon: InkWell(
                                                      onTap: () => safeSetState(
                                                            () => _model
                                                            .passwordCreateConfirmVisibility =
                                                        !_model
                                                            .passwordCreateConfirmVisibility,
                                                      ),
                                                      focusNode: FocusNode(
                                                          skipTraversal: true),
                                                      child: Icon(
                                                        _model.passwordCreateConfirmVisibility
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
                                                      .passwordCreateConfirmTextControllerValidator
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
                                                    if(await _model.createAccountSuccess(context) == true && context.mounted) {
                                                      context.push('/mainpage');
                                                    }
                                                  },
                                                  text: 'Get Started',
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
                                      'columnOnPageLoadAnimation1']!),
                                    ),
                                  ),
                                  Align(
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
                                            if (responsiveVisibility(
                                              context: context,
                                              phone: false,
                                              tablet: false,
                                            ))
                                              Container(
                                                width: 230,
                                                height: 16,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                      context)
                                                      .secondaryBackground,
                                                ),
                                              ),
                                            Text(
                                              'Welcome Back',
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
                                                '물리실 물품을 손쉽게 관리하고\n편하게 대여할 수 있도록 개발한 프로그램',
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
                                                    if(await _model.signInSuccess(context) == true && context.mounted) {
                                                      context.push('/mainpage');
                                                    }
                                                  },
                                                  text: 'Sign In',
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
                                ],
                              ),
                            ),
                            Align(
                              alignment: const Alignment(0, 0),
                              child: FlutterFlowButtonTabBar(
                                useToggleButtonStyle: true,
                                labelStyle: FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodyLargeFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .bodyLargeFamily),
                                ),
                                unselectedLabelStyle:
                                FlutterFlowTheme.of(context)
                                    .bodyLarge
                                    .override(
                                  fontFamily:
                                  FlutterFlowTheme.of(context)
                                      .bodyLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(
                                      FlutterFlowTheme.of(context)
                                          .bodyLargeFamily),
                                ),
                                labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                                unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                                backgroundColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                unselectedBackgroundColor:
                                FlutterFlowTheme.of(context)
                                    .primaryBackground,
                                borderColor:
                                FlutterFlowTheme.of(context).alternate,
                                unselectedBorderColor:
                                FlutterFlowTheme.of(context).alternate,
                                borderWidth: 2,
                                borderRadius: 12,
                                elevation: 0,
                                labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                buttonMargin: const EdgeInsetsDirectional.fromSTEB(
                                    12, 0, 12, 0),
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 0),
                                tabs: const [
                                  Tab(
                                    text: 'Create Account',
                                  ),
                                  Tab(
                                    text: 'Log In',
                                  ),
                                ],
                                controller: _model.tabBarController,
                                onTap: (i) async {
                                  [() async {}, () async {}][i]();
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ).animateOnPageLoad(
                        animationsMap['containerOnPageLoadAnimation']!),
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
