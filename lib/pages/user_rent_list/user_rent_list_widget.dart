import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'user_rent_list_model.dart';
export 'user_rent_list_model.dart';

class UserRentListWidget extends StatefulWidget {
  const UserRentListWidget({super.key});

  @override
  State<UserRentListWidget> createState() => _UserRentListWidgetState();
}

class _UserRentListWidgetState extends State<UserRentListWidget>
    with TickerProviderStateMixin {
  late UserRentListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? userName;

  void getSuppliesRoomData() async{
    await _model.getSuppliesRoomData();
    _model.getSuppliesData = true;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => UserRentListModel());

    getSuppliesRoomData();

    User? user = FirebaseAuth.instance.currentUser;
    if(user != null) userName = user.email;
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
              '신청 목록',
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
                if(_model.getSuppliesData == false)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for(int i = 0; i < suppliesRoomInfo.applicationUserName.length; i++)
                          if(userName == suppliesRoomInfo.applicationUserName[i])
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
                                            onPressed: () async{
                                              await _model.rentCancelOnTap(context, i);
                                              setState(() {});
                                            },
                                            text: '신청 취소',
                                            options: FFButtonOptions(
                                              width: 95.0,
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
