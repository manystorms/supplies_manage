import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:supplies_manage/devicesearch/devicesearch_model.dart';
import 'package:supplies_manage/show_alert.dart';
import 'devicename_model.dart';
export 'devicename_model.dart';

class DevicenameWidget extends StatefulWidget {
  final int suppliesNum;

  @immutable
  const DevicenameWidget({required this.suppliesNum});

  @override
  State<DevicenameWidget> createState() => _DevicenameWidgetState();
}

class _DevicenameWidgetState extends State<DevicenameWidget> {
  late DevicenameModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DevicenameModel());

    _model.textFieldFocusNode ??= FocusNode();
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
        title: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Text(
            suppliesRoomInfo.name[widget.suppliesNum],
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Pretendard',
              letterSpacing: 0.0,
              useGoogleFonts: false,
            ),
          ),
        ),
        actions: const [],
        centerTitle: false,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              //width: 411.0,
              height: 338.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width *
                            0.4, // 화면 크기에 따라 너비 조정
                        child: AspectRatio(
                          aspectRatio: 3 / 4, // 비율 유지
                          child: Image.network(
                            suppliesRoomInfo.imageUrl[widget.suppliesNum],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    //width: 161.0,
                    height: 263.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(height: 20),
                        Container(
                          //width: 100.0,
                          //height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Text(
                            '전체 수량: ${suppliesRoomInfo.amount[widget.suppliesNum]}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Pretendard',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          //width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Text(
                            '대여 가능 수량 : ${suppliesRoomInfo.availableAmount[widget.suppliesNum]}',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                              fontFamily: 'Pretendard',
                              letterSpacing: 0.0,
                              useGoogleFonts: false,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-0.9, 0.0),
              child: Text(
                '대여 사유',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                  fontFamily: 'Pretendard',
                  letterSpacing: 0.0,
                  useGoogleFonts: false,
                  fontSize: 19,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // 텍스트 필드
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 200.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: TextFormField(
                      controller: _model.textController,
                      focusNode: _model.textFieldFocusNode,
                      autofocus: false,
                      obscureText: false,
                      expands: true,
                      maxLines: null,
                      maxLength: 500,
                      textAlignVertical: TextAlignVertical.top,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Pretendard',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                          fontSize: 15,
                        ),
                        hintText: '포함되어야 하는 사항: ~~~~',
                        hintStyle:
                        FlutterFlowTheme.of(context).labelMedium.override(
                          fontFamily: 'Pretendard',
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                          fontSize: 15,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.transparent, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: Colors.grey, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        filled: true,
                        fillColor:
                        FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Pretendard',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                        fontSize: 15,
                      ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      validator:
                      _model.textControllerValidator.asValidator(context),
                    ),
                  ),

                  const SizedBox(height: 20.0),

                  // 대여 수량
                  Container(
                    height: 53.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '대여 수량',
                          style:
                          FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Pretendard',
                            letterSpacing: 0.0,
                            fontSize: 19,
                            useGoogleFonts: false,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Container(
                          width: 150.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: FlutterFlowCountController(
                            decrementIconBuilder: (enabled) => Icon(
                              Icons.remove_rounded,
                              color: enabled
                                  ? FlutterFlowTheme.of(context).secondaryText
                                  : FlutterFlowTheme.of(context).alternate,
                              size: 24.0,
                            ),
                            incrementIconBuilder: (enabled) => Icon(
                              Icons.add_rounded,
                              color: enabled
                                  ? FlutterFlowTheme.of(context).primary
                                  : FlutterFlowTheme.of(context).alternate,
                              size: 24.0,
                            ),
                            countBuilder: (count) => Text(
                              count.toString(),
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                fontFamily: 'Pretendard',
                                letterSpacing: 0.0,
                                useGoogleFonts: false,
                              ),
                            ),
                            count: _model.countControllerValue,
                            updateCount: (count) => setState(
                                    () => _model.countControllerValue = count),
                            minimum: 1,
                            maximum:
                            suppliesRoomInfo.availableAmount[widget.suppliesNum], // 가변 최대 수량 설정
                            stepSize: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            /////////////////////////////////////////////////////////////////////////
            Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 24.0),
                child: FFButtonWidget(
                  onPressed: () async {
                    if (await showAlertWithTwoChoice(context, '대여 신청하시겠습니까?', '예', '아니오') == true && context.mounted) {
                      try{
                        await _model.applicationRentButtonPressed(widget.suppliesNum);
                        await showAlertWithoutChoice(context, '대여 완료되었습니다');
                        context.pop();
                      }catch(e){
                        await showAlertWithoutChoice(context, '오류가 발생해 대여가 되지 않았습니다');
                      }
                    }
                  },
                  text: '대여 신청',
                  options: FFButtonOptions(
                    width: 300.0,
                    height: 60.0,
                    padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                    const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                    FlutterFlowTheme.of(context).headlineSmall.override(
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
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
