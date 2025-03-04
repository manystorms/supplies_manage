import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:supplies_manage/model/sign_in_sign_up.dart';
import 'mainpage_model.dart';
export 'mainpage_model.dart';

class MainPageWidget extends StatefulWidget {
  const MainPageWidget({super.key});

  @override
  State<MainPageWidget> createState() => _MainPageWidgetState();
}

class _MainPageWidgetState extends State<MainPageWidget> {
  late MainPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MainPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: Image.network(
                      'https://images.unsplash.com/photo-1626684496076-07e23c6361ff?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8bW91bnRhaW4lMjBob3VzZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=900&q=60',
                    ).image,
                  ),
                ),
                child: Container(
                  width: 210.0,
                  height: 92.0,
                  decoration: const BoxDecoration(
                    color: Color(0x9A1D2428),
                  ),
                  child: Stack(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 100.0, 16.0, 12.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 8.0),
                                  child: Text(
                                    '물리 준비실 물품 대여',
                                    style: FlutterFlowTheme.of(context)
                                        .displaySmall
                                        .override(
                                      fontFamily: 'Moneygraphy',
                                      color: Colors.white,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.bold,
                                      useGoogleFonts: false,
                                    ),
                                  ),
                                ),
                                Text(
                                  '물리 준비실 물품 파악 및 신청',
                                  style:
                                  FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Pretendard',
                                    color: const Color(0xBEFFFFFF),
                                    letterSpacing: 0.0,
                                    useGoogleFonts: false,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: const AlignmentDirectional(1, -1),
                        child: SafeArea(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Dialog(
                                              child: Padding(
                                                padding: const EdgeInsets.all(12),
                                                child: Container(
                                                  width: 210,
                                                  height: 160,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                    borderRadius: BorderRadius.circular(8),
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(12),
                                                    child: Column(
                                                      mainAxisSize: MainAxisSize.max,
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                        Icon(
                                                          Icons.account_circle,
                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                          size: 60,
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                          child: Text(
                                                            userName,
                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                              fontFamily: 'Pretendard',
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: false,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                          child: Text(
                                                            userRole.name,
                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                              fontFamily: 'Pretendard',
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: false,
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 0, 0),
                                                          child: SelectableText(
                                                            userUid,
                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                              fontFamily: 'Pretendard',
                                                              letterSpacing: 0.0,
                                                              useGoogleFonts: false,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }
                                      );
                                    },
                                    child: const Icon(
                                      Icons.account_circle,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () => _model.logOutButtonOnTap(context),
                                    child: const Icon(
                                      Icons.logout_rounded,
                                      color: Colors.white,
                                      size: 30,
                                    ),
                                  )
                                ],
                              ),
                            ),
                        )
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 52.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    for(TileInfo tileInfo in tile)
                      if(tileInfo.role == userRole)
                        InkWell(
                          onTap: () => context.push(tileInfo.linkedPage),
                          child: Padding(
                            padding:
                            const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 8.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color:
                                FlutterFlowTheme.of(context).secondaryBackground,
                                boxShadow: const [
                                  BoxShadow(
                                    blurRadius: 3.0,
                                    color: Color(0x411D2429),
                                    offset: Offset(
                                      0.0,
                                      1.0,
                                    ),
                                  )
                                ],
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 20.0, 0.0, 0.0),
                                      child: Text(
                                        tileInfo.title,
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                          fontFamily: 'Pretendard',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 3,),
                                    Padding(
                                      padding: const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 8.0, 8.0, 0.0),
                                      child: AutoSizeText(
                                        '필요한 물품 검색하여 대여 신청',
                                        textAlign: TextAlign.start,
                                        style: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                          fontFamily: 'Pretendard',
                                          letterSpacing: 0.0,
                                          useGoogleFonts: false,
                                        ),
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          8.0, 0.0, 8.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.chevron_right_rounded,
                                            color: Color(0xFF57636C),
                                            size: 30.0,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
