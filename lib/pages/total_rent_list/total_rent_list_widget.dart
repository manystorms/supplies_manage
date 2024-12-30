import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'total_rent_list_model.dart';
export 'total_rent_list_model.dart';

class TotalRentListWidget extends StatefulWidget {
  const TotalRentListWidget({super.key});

  @override
  State<TotalRentListWidget> createState() => _TotalRentListWidgetState();
}

class _TotalRentListWidgetState extends State<TotalRentListWidget>
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
                                    const Spacer(),
                                    const SizedBox(width: 15),
                                    Text(
                                      '대여 신청자: ${suppliesRoomInfo.applicationUserName[i]}\n'
                                          '대여 수량: ${suppliesRoomInfo.applicationRentAmount[i]}\n'
                                          '대여 사유: ${suppliesRoomInfo.applicationRentReason[i]??'없음'}\n'
                                          '현재 상태: ${suppliesRoomInfo.applicationRentState[i]}'
                                    ),
                                    const SizedBox(width: 10)
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
