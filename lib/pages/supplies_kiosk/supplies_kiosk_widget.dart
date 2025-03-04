import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import 'supplies_kiosk_model.dart';
export 'supplies_kiosk_model.dart';

class SuppliesKioskWidget extends StatefulWidget {
  const SuppliesKioskWidget({super.key});

  @override
  State<SuppliesKioskWidget> createState() => _SuppliesKioskWidgetState();
}

class _SuppliesKioskWidgetState extends State<SuppliesKioskWidget>
    with TickerProviderStateMixin {
  late SuppliesKioskModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  void getSuppliesRoomData() async{
    await _model.getSuppliesRoomData();
    _model.getSuppliesData = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SuppliesKioskModel());

    _model.searchBarTextController ??= TextEditingController();
    _model.searchBarFocusNode ??= FocusNode();

    getSuppliesRoomData();

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    animationsMap.addAll({
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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 35.0,
              ),
            ),
            title: Text(
              '물품/대여 반납',
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
        body: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 8, 0),
                        child: TextFormField(
                          controller: _model.searchBarTextController,
                          focusNode: _model.searchBarFocusNode,
                          textCapitalization: TextCapitalization.words,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: '물품 검색',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                              fontFamily: 'Pretendard',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
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
                            FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding:
                            const EdgeInsetsDirectional.fromSTEB(24, 24, 20, 24),
                            prefixIcon: Icon(
                              Icons.search,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 16,
                            ),
                          ),
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Pretendard',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                          validator: _model.searchBarTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 12, 12, 0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30,
                        borderWidth: 1,
                        buttonSize: 50,
                        icon: Icon(
                          Icons.search_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30,
                        ),
                        onPressed: () {
                          print('IconButton pressed ...');
                        },
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 20),
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
                                  child: _model.getSuppliesData == false
                                    ? const CircularProgressIndicator():
                                              SingleChildScrollView(
                                              child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                for(int i = 0; i < suppliesRoomInfo.applicationUserName.length; i++)
                                                  if(suppliesRoomInfo.applicationRentState[i] == '대여 신청')
                                                    Padding(
                                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                                          16.0, 8.0, 16.0, 0.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration: BoxDecoration(
                                                          color: FlutterFlowTheme.of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                          BorderRadius.circular(12.0),
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(
                                                              8.0, 8.0, 12.0, 8.0),
                                                          child: Row(
                                                            mainAxisSize: MainAxisSize.max,
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.center,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                BorderRadius.circular(8.0),
                                                                child: Image.network(
                                                                  _model.getImageUrl(i),
                                                                  width: 70.0,
                                                                  height: 70.0,
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding: const EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                    16.0, 0.0, 0.0, 0.0),
                                                                child: SizedBox(
                                                                  width: 80,
                                                                  child: Text(
                                                                    suppliesRoomInfo.applicationSuppliesName[i],
                                                                    style:
                                                                    FlutterFlowTheme.of(context)
                                                                        .bodyLarge
                                                                        .override(
                                                                      fontFamily:
                                                                      'Pretendard',
                                                                      letterSpacing: 0.0,
                                                                      useGoogleFonts: false,
                                                                    ),
                                                                    overflow: TextOverflow.ellipsis,
                                                                    maxLines: 3,
                                                                  ),
                                                                )
                                                              ),
                                                              const Spacer(),
                                                              (MediaQuery.of(context).size.width > 550)?
                                                                Row(
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: [
                                                                    Text(
                                                                        '대여 신청자: ${suppliesRoomInfo.applicationUserName[i]}\n'
                                                                            '대여 수량: ${suppliesRoomInfo.applicationRentAmount[i]}\n'
                                                                            '현재 상태: ${suppliesRoomInfo.applicationRentState[i]}'
                                                                    ),
                                                                    const SizedBox(width: 10),
                                                                    FFButtonWidget(
                                                                      onPressed: () async {
                                                                        await _model.rentButtonOnTap(context, i);
                                                                        setState(() {});
                                                                      },
                                                                      text: '대여',
                                                                      options: FFButtonOptions(
                                                                        width: 75.0,
                                                                        height: 70.0,
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                        iconPadding:
                                                                        const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                          fontFamily: 'Pretendard',
                                                                          color: Colors.white,
                                                                          letterSpacing: 0.0,
                                                                          useGoogleFonts: false,
                                                                        ),
                                                                        elevation: 3.0,
                                                                        borderSide: const BorderSide(
                                                                          color: Colors.transparent,
                                                                          width: 1.0,
                                                                        ),
                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ):
                                                              Column(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 140,
                                                                    child: Text(
                                                                        '대여 신청자: ${suppliesRoomInfo.applicationUserName[i]}\n'
                                                                            '대여 수량: ${suppliesRoomInfo.applicationRentAmount[i]}\n'
                                                                            '현재 상태: ${suppliesRoomInfo.applicationRentState[i]}'
                                                                    ),
                                                                  ),
                                                                  FFButtonWidget(
                                                                    onPressed: () async {
                                                                      await _model.rentButtonOnTap(context, i);
                                                                      setState(() {});
                                                                    },
                                                                    text: '대여',
                                                                    options: FFButtonOptions(
                                                                      width: 75.0,
                                                                      height: 40.0,
                                                                      padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                      iconPadding:
                                                                      const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                      textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                        fontFamily: 'Pretendard',
                                                                        color: Colors.white,
                                                                        letterSpacing: 0.0,
                                                                        useGoogleFonts: false,
                                                                      ),
                                                                      elevation: 3.0,
                                                                      borderSide: const BorderSide(
                                                                        color: Colors.transparent,
                                                                        width: 1.0,
                                                                      ),
                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
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
                                  child: _model.getSuppliesData == false
                                      ? const CircularProgressIndicator():
                                  SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        for(int i = 0; i < suppliesRoomInfo.applicationUserName.length; i++)
                                          if(suppliesRoomInfo.applicationRentState[i] == '대여 중')
                                            Padding(
                                              padding: const EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 8.0, 16.0, 0.0),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                  BorderRadius.circular(12.0),
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                                      8.0, 8.0, 12.0, 8.0),
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.max,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                        BorderRadius.circular(8.0),
                                                        child: Image.network(
                                                          _model.getImageUrl(i),
                                                          width: 70.0,
                                                          height: 70.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsetsDirectional
                                                            .fromSTEB(
                                                            16.0, 0.0, 0.0, 0.0),
                                                        child: SizedBox(
                                                          width: 80,
                                                          child: Text(
                                                            suppliesRoomInfo.applicationSuppliesName[i],
                                                            style:
                                                            FlutterFlowTheme.of(context)
                                                                .bodyLarge
                                                                .override(
                                                              fontFamily:
                                                              'Pretendard',
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: false,
                                                            ),
                                                            overflow: TextOverflow.ellipsis,
                                                            maxLines: 3,
                                                          ),
                                                        )
                                                      ),
                                                      const Spacer(),
                                                      const SizedBox(width: 15),
                                                      Text(
                                                          '대여 신청자: ${suppliesRoomInfo.applicationUserName[i]}\n'
                                                              '대여 수량: ${suppliesRoomInfo.applicationRentAmount[i]}\n'
                                                              '현재 상태: ${suppliesRoomInfo.applicationRentState[i]}'
                                                      ),
                                                      const SizedBox(width: 10),
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          await _model.returnButtonOnTap(context, i);
                                                          setState(() {});
                                                        },
                                                        text: '반납',
                                                        options: FFButtonOptions(
                                                          width: 75.0,
                                                          height: 70.0,
                                                          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                          iconPadding:
                                                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                          color: FlutterFlowTheme.of(context).primary,
                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                            fontFamily: 'Pretendard',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: false,
                                                          ),
                                                          elevation: 3.0,
                                                          borderSide: const BorderSide(
                                                            color: Colors.transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius: BorderRadius.circular(8.0),
                                                        ),
                                                      ),
                                                    ],
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
                            labelStyle:
                            FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Pretendard',
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                              useGoogleFonts: false,
                            ),
                            unselectedLabelStyle:
                            FlutterFlowTheme.of(context).bodyLarge.override(
                              fontFamily: 'Pretendard',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                            labelColor:
                            FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                            backgroundColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            unselectedBackgroundColor:
                            FlutterFlowTheme.of(context).primaryBackground,
                            borderColor: FlutterFlowTheme.of(context).alternate,
                            unselectedBorderColor:
                            FlutterFlowTheme.of(context).alternate,
                            borderWidth: 2,
                            borderRadius: 12,
                            elevation: 0,
                            labelPadding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            buttonMargin:
                            const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                            tabs: const [
                              Tab(
                                text: '대여',
                              ),
                              Tab(
                                text: '반납',
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
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
