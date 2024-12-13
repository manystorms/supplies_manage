import '/flutter_flow/flutter_flow_button_tabbar.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'devicesearch_model.dart';
export 'devicesearch_model.dart';

class DevicesearchWidget extends StatefulWidget {
  const DevicesearchWidget({super.key});

  @override
  State<DevicesearchWidget> createState() => _DevicesearchWidgetState();
}

class _DevicesearchWidgetState extends State<DevicesearchWidget>
    with TickerProviderStateMixin {
  late DevicesearchModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void getSuppliesRoomData() async{
    await _model.getSuppliesRoomData();
    _model.getSuppliesData = true;
    setState(() {});
  }

  @override
  void initState(){
    super.initState();
    _model = createModel(context, () => DevicesearchModel());

    _model.searchBarTextController ??= TextEditingController();
    _model.searchBarFocusNode ??= FocusNode();

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));
    getSuppliesRoomData();
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50.0),
          child: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30.0,
              borderWidth: 1.0,
              buttonSize: 60.0,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30.0,
              ),
              onPressed: () {
                context.pop();
              },
            ),
            title: Text(
              '실험 기구 검색',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                    fontFamily: 'Pretendard',
                    letterSpacing: 0.0,
                    useGoogleFonts: false,
                  ),
            ),
            actions: const [],
            centerTitle: false,
            elevation: 0.0,
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
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 8.0, 0.0),
                        child: TextFormField(
                          controller: _model.searchBarTextController,
                          focusNode: _model.searchBarFocusNode,
                          textCapitalization: TextCapitalization.words,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Search for your items...',
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
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 20.0, 24.0),
                            prefixIcon: Icon(
                              Icons.search,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 16.0,
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
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 12.0, 0.0),
                      child: FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 30.0,
                        borderWidth: 1.0,
                        buttonSize: 50.0,
                        icon: Icon(
                          Icons.search_sharp,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 30.0,
                        ),
                        onPressed: () {
                          print('검색 버튼_devicesearch'); //검색버튼??
                        },
                      ),
                    ),
                  ],
                ),
                if(_model.getSuppliesData == false)
                  const CircularProgressIndicator()
                else
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(-1.0, 0),
                          child: FlutterFlowButtonTabBar(
                            useToggleButtonStyle: false,
                            isScrollable: true,
                            labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                              fontFamily: 'Pretendard',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                            ),
                            unselectedLabelStyle: const TextStyle(),
                            labelColor: FlutterFlowTheme.of(context).primary,
                            unselectedLabelColor:
                            FlutterFlowTheme.of(context).secondaryText,
                            backgroundColor: FlutterFlowTheme.of(context).accent1,
                            borderColor: FlutterFlowTheme.of(context).primary,
                            borderWidth: 2.0,
                            borderRadius: 12.0,
                            elevation: 0.0,
                            labelPadding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            buttonMargin: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 12.0, 16.0, 0.0),
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 16.0, 0.0),
                            tabs: const [
                              Tab(
                                text: '역학',
                              ),
                              Tab(
                                text: '전자기학',
                              ),
                              Tab(
                                text: '센서',
                              ),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}, () async {}][i]();
                            },
                          ),
                        ),
                        Expanded(
                          child: TabBarView(
                            controller: _model.tabBarController,
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for(int i = 0; i < _model.suppliesRoomInfo.name.length; i++)
                                      InkWell(
                                        onTap: () {
                                          print('first_tap_search ${i}');
                                        },
                                        child: Padding(
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
                                                      'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/7c5678f4-c28d-4862-a8d9-56750f839f12/zion-1-basketball-shoes-bJ0hLJ.png',
                                                      width: 70.0,
                                                      height: 70.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                    child: Text(
                                                      _model.suppliesRoomInfo.name[i],
                                                      style:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily:
                                                        'Pretendard',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),    //남은 공간 모두 차지하여, 버튼 오른쪽으로 위치하도록.
                                                  Row(         //위치, 신청 버튼 수정 부분
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () {
                                                          print('실험 기구 검색에서 맵으로 이동하는 버튼');
                                                          context.push('/map1');
                                                        },
                                                        text: '위치',
                                                        options: FFButtonOptions(
                                                          width: 75.0,
                                                          height: 70.0,
                                                          padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(24.0, 0.0,
                                                              24.0, 0.0),
                                                          iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .primary,
                                                          textStyle: FlutterFlowTheme
                                                              .of(context)
                                                              .titleSmall
                                                              .override(
                                                            fontFamily:
                                                            'Pretendard',
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: false,
                                                          ),
                                                          elevation: 3.0,
                                                          borderSide: const BorderSide(
                                                            color: Colors.transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 12.0),
                                                      FFButtonWidget(
                                                        onPressed: () {
                                                          context.push('/devicename/$i');
                                                        },
                                                        text: '신청',
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

                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for(int i = 0; i < _model.suppliesRoomInfo.name.length; i++)
                                      InkWell(
                                        onTap: () {
                                          print('first_tap_search ${i}');
                                        },
                                        child: Padding(
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
                                                      'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/7c5678f4-c28d-4862-a8d9-56750f839f12/zion-1-basketball-shoes-bJ0hLJ.png',
                                                      width: 70.0,
                                                      height: 70.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                    child: Text(
                                                      _model.suppliesRoomInfo.name[i],
                                                      style:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily:
                                                        'Pretendard',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),    //남은 공간 모두 차지하여, 버튼 오른쪽으로 위치하도록.
                                                  Row(         //위치, 신청 버튼 수정 부분
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () {
                                                          print('실험 기구 검색에서 맵으로 이동하는 버튼');
                                                          context.push('/map1');
                                                        },
                                                        text: '위치',
                                                        options: FFButtonOptions(
                                                          width: 75.0,
                                                          height: 70.0,
                                                          padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(24.0, 0.0,
                                                              24.0, 0.0),
                                                          iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .primary,
                                                          textStyle: FlutterFlowTheme
                                                              .of(context)
                                                              .titleSmall
                                                              .override(
                                                            fontFamily:
                                                            'Pretendard',
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: false,
                                                          ),
                                                          elevation: 3.0,
                                                          borderSide: const BorderSide(
                                                            color: Colors.transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 12.0),
                                                      FFButtonWidget(
                                                        onPressed: () {
                                                          print('물품 신청하는 버튼');
                                                          context.push('/devicename');
                                                        },
                                                        text: '신청',
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

                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                              ),
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    for(int i = 0; i < _model.suppliesRoomInfo.name.length; i++)
                                      InkWell(
                                        onTap: () {
                                          print('first_tap_search ${i}');
                                        },
                                        child: Padding(
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
                                                      'https://static.nike.com/a/images/c_limit,w_592,f_auto/t_product_v1/7c5678f4-c28d-4862-a8d9-56750f839f12/zion-1-basketball-shoes-bJ0hLJ.png',
                                                      width: 70.0,
                                                      height: 70.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsetsDirectional
                                                        .fromSTEB(
                                                        16.0, 0.0, 0.0, 0.0),
                                                    child: Text(
                                                      _model.suppliesRoomInfo.name[i],
                                                      style:
                                                      FlutterFlowTheme.of(context)
                                                          .bodyLarge
                                                          .override(
                                                        fontFamily:
                                                        'Pretendard',
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: false,
                                                      ),
                                                    ),
                                                  ),
                                                  const Spacer(),    //남은 공간 모두 차지하여, 버튼 오른쪽으로 위치하도록.
                                                  Row(         //위치, 신청 버튼 수정 부분
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      FFButtonWidget(
                                                        onPressed: () {
                                                          print('실험 기구 검색에서 맵으로 이동하는 버튼');
                                                          context.push('/map1');
                                                        },
                                                        text: '위치',
                                                        options: FFButtonOptions(
                                                          width: 75.0,
                                                          height: 70.0,
                                                          padding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(24.0, 0.0,
                                                              24.0, 0.0),
                                                          iconPadding:
                                                          const EdgeInsetsDirectional
                                                              .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                          color: FlutterFlowTheme.of(
                                                              context)
                                                              .primary,
                                                          textStyle: FlutterFlowTheme
                                                              .of(context)
                                                              .titleSmall
                                                              .override(
                                                            fontFamily:
                                                            'Pretendard',
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts: false,
                                                          ),
                                                          elevation: 3.0,
                                                          borderSide: const BorderSide(
                                                            color: Colors.transparent,
                                                            width: 1.0,
                                                          ),
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                        ),
                                                      ),
                                                      const SizedBox(width: 12.0),
                                                      FFButtonWidget(
                                                        onPressed: () {
                                                          print('물품 신청하는 버튼');
                                                          context.push('/devicename');
                                                        },
                                                        text: '신청',
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
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
