import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/flutter_flow/flutter_flow_count_controller.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:supplies_manage/show_alert.dart';

import 'map_model.dart';
export 'map_model.dart';

class MapWidget extends StatefulWidget {
  final String locationData;

  @immutable
  const MapWidget({required this.locationData});

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  late MapModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MapModel());

    _model.processLocationData(widget.locationData);
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
                context.pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 24,
              ),
            ),
            title: Text(
              '지도',
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
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              alignment: Alignment.center,
              child: Text(
                '창문',
                textAlign: TextAlign.start,
                style:
                FlutterFlowTheme.of(context)
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
              ),
            ),
            for(int i = 1; i <= 4; i++)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: _model.getLocationMode ? () {
                        _model.choiceColumn = i;
                        _model.choiceRow = 1;
                        setState(() {});
                      } : null,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: (i == _model.choiceColumn && 1 == _model.choiceRow)? Colors.orangeAccent:Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular((i == 4) ? 25 : 0),
                            bottomRight: Radius.circular((i == 4) ? 25 : 0),
                            topLeft: Radius.circular((i == 1) ? 25 : 0),
                            topRight: Radius.circular((i == 1) ? 25 : 0),
                          ),
                          border: Border.all(
                            color: Colors.black,
                            width: 5,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: (i == _model.choiceColumn && 1 == _model.choiceRow && !_model.getLocationMode) ? Text(
                          '${_model.choiceFloor.toString()}층',
                          textAlign: TextAlign.start,
                          style:
                          FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                            fontSize: 23,
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
                        ):null,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: _model.getLocationMode ? () {
                        _model.choiceColumn = i;
                        _model.choiceRow = 2;
                        setState(() {});
                      } : null,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: (i == _model.choiceColumn && 2 == _model.choiceRow)? Colors.orangeAccent:Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular((i == 4) ? 25 : 0),
                            bottomRight: const Radius.circular(0),
                            topLeft: Radius.circular((i == 1) ? 25 : 0),
                            topRight: const Radius.circular(0),
                          ),
                          border: Border.all(
                            color: Colors.black,
                            width: 5,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: (i == _model.choiceColumn && 2 == _model.choiceRow && !_model.getLocationMode) ? Text(
                          '${_model.choiceFloor.toString()}층',
                          textAlign: TextAlign.start,
                          style:
                          FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                            fontSize: 23,
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
                        ):null,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: _model.getLocationMode ? () {
                        _model.choiceColumn = i;
                        _model.choiceRow = 3;
                        setState(() {});
                      } : null,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: (i == _model.choiceColumn && 3 == _model.choiceRow)? Colors.orangeAccent:Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: const Radius.circular(0),
                            bottomRight: Radius.circular((i == 4) ? 25 : 0),
                            topLeft: const Radius.circular(0),
                            topRight: Radius.circular((i == 1) ? 25 : 0),
                          ),
                          border: Border.all(
                            color: Colors.black,
                            width: 5,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: (i == _model.choiceColumn && 3 == _model.choiceRow && !_model.getLocationMode) ? Text(
                          '${_model.choiceFloor.toString()}층',
                          textAlign: TextAlign.start,
                          style:
                          FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                            fontSize: 23,
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
                        ):null,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: InkWell(
                      onTap: _model.getLocationMode ? () {
                        _model.choiceColumn = i;
                        _model.choiceRow = 4;
                        setState(() {});
                      } : null,
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: (i == _model.choiceColumn && 4 == _model.choiceRow)? Colors.orangeAccent:Colors.blueAccent,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular((i == 4) ? 25 : 0),
                            bottomRight: Radius.circular((i == 4) ? 25 : 0),
                            topLeft: Radius.circular((i == 1) ? 25 : 0),
                            topRight: Radius.circular((i == 1) ? 25 : 0),
                          ),
                          border: Border.all(
                            color: Colors.black,
                            width: 5,
                          ),
                        ),
                        alignment: Alignment.center,
                        child: (i == _model.choiceColumn && 4 == _model.choiceRow && !_model.getLocationMode) ? Text(
                          '${_model.choiceFloor.toString()}층',
                          textAlign: TextAlign.start,
                          style:
                          FlutterFlowTheme.of(context)
                              .labelMedium
                              .override(
                            fontSize: 23,
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
                        ):null,
                      ),
                    ),
                  )
                ],
              ),
            if(_model.getLocationMode)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: const AlignmentDirectional(1, 0),
                    child: Text(
                      '물품이 위치한 층',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontSize: 23,
                        fontFamily: 'Pretendard',
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                    ),
                  ),
                  Align(
                    alignment: const AlignmentDirectional(1, 0),
                    child: Container(
                      width: 120,
                      height: 40,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(8),
                        shape: BoxShape.rectangle,
                      ),
                      child: FlutterFlowCountController(
                        decrementIconBuilder: (enabled) => Icon(
                          Icons.remove_rounded,
                          color: enabled
                              ? FlutterFlowTheme.of(context).secondaryText
                              : FlutterFlowTheme.of(context).alternate,
                          size: 30,
                        ),
                        incrementIconBuilder: (enabled) => Icon(
                          Icons.add_rounded,
                          color: enabled
                              ? FlutterFlowTheme.of(context).primary
                              : FlutterFlowTheme.of(context).alternate,
                          size: 30,
                        ),
                        countBuilder: (count) => Text(
                          count.toString(),
                          style: FlutterFlowTheme.of(context).titleLarge.override(
                            fontFamily: 'Pretendard',
                            letterSpacing: 0.0,
                            useGoogleFonts: false,
                          ),
                        ),
                        count: _model.choiceFloor,
                        updateCount: (count) =>
                            safeSetState(() => _model.choiceFloor = count),
                        minimum: 1,
                        stepSize: 1,
                        contentPadding: const EdgeInsetsDirectional.fromSTEB(12, 0, 12, 0),
                      ),
                    ),
                  ),
                ],
              ),
            if(_model.getLocationMode)
              Align(
                alignment: const AlignmentDirectional(0, 0),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 24),
                  child: FFButtonWidget(
                    onPressed: () {
                      if(_model.choiceColumn != 0 && _model.choiceRow != 0) {
                        context.pop('${_model.choiceColumn}-${_model.choiceRow}-${_model.choiceFloor}');
                      }else{
                        showAlertWithoutChoice(context, '물품의 위치를 선택하세요');
                      }
                    },
                    text: '입력 완료',
                    options: FFButtonOptions(
                      width: 300,
                      height: 60,
                      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      iconPadding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                      color: FlutterFlowTheme.of(context).primary,
                      textStyle: FlutterFlowTheme.of(context).headlineSmall.override(
                        fontFamily: 'Pretendard',
                        color: Colors.white,
                        letterSpacing: 0.0,
                        useGoogleFonts: false,
                      ),
                      elevation: 3,
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              )
          ],
        ),
      ),
    );
  }
}
