import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:supplies_manage/variables_file.dart';
import 'devicename_model.dart';
export 'devicename_model.dart';

class DevicenameWidget extends StatefulWidget {
  final int indexNum;

  @immutable
  const DevicenameWidget({required this.indexNum});

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
            print('뒤로가기_devicename');
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left_rounded,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 35.0,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.only(top: 2.0),
          child: Text(
            ' ${name[widget.indexNum]}',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              fontFamily: 'Pretendard',
              letterSpacing: 0.0,
              useGoogleFonts: false,
            ),
          ),
        ),
        actions: [],
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
                    padding: EdgeInsets.all(25.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width *
                            0.4, // 화면 크기에 따라 너비 조정
                        child: AspectRatio(
                          aspectRatio: 3 / 4, // 비율 유지
                          child: Image.network(
                            'https://images.unsplash.com/photo-1575052814086-f385e2e2ad1b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8eW9nYXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
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
                        SizedBox(height: 20),
                        Container(
                          //width: 100.0,
                          //height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Text(
                            '전체 수량: ${amount[widget.indexNum]}',
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
                        SizedBox(height: 10),
                        Container(
                          //width: MediaQuery.sizeOf(context).width * 0.8,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Text(
                            '대여 가능 수량 : ${availableAmount[widget.indexNum]}',
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
              alignment: AlignmentDirectional(-0.9, 0.0),
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
            SizedBox(height: 10),
            ////////////////////////////////////////////////////////////////////////////////////////////////////////
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
                          BorderSide(color: Colors.transparent, width: 1.0),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Colors.grey, width: 1.0),
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

                  SizedBox(height: 20.0),

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
                        SizedBox(width: 10.0),
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
                            count: _model.countControllerValue ??= 1,
                            updateCount: (count) => setState(
                                    () => _model.countControllerValue = count),
                            minimum: 1,
                            maximum:
                            availableAmount[widget.indexNum], // 가변 최대 수량 설정
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
              alignment: AlignmentDirectional(0.0, 0.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 24.0),
                child: FFButtonWidget(
                  onPressed: () {
                    print('대여항목 넘겨주는 버튼_devicename');
                    showCupertinoDialog(
                      //대여할지 물어보는 알림창 생성
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return AlertDialog(content: Text('대여할까요?'), actions: [
                            Center(
                              child: Column(
                                children: [
                                  TextButton(
                                    child: Text('예'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      context.pop(); // 인수 보내야 함
                                    },
                                  ),
                                  SizedBox(height: 12.0),
                                  TextButton(
                                    child: Text('아니요'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ]);
                        });
                  },
                  text: '대여 하기',
                  options: FFButtonOptions(
                    width: 300.0,
                    height: 60.0,
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    iconPadding:
                    EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: FlutterFlowTheme.of(context).primary,
                    textStyle:
                    FlutterFlowTheme.of(context).headlineSmall.override(
                      fontFamily: 'Pretendard',
                      color: Colors.white,
                      letterSpacing: 0.0,
                      useGoogleFonts: false,
                    ),
                    elevation: 3.0,
                    borderSide: BorderSide(
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
