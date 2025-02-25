import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:supplies_manage/pages/rent_status_list/rent_status_list_model.dart';
import 'package:google_fonts/google_fonts.dart';
export 'rent_status_list_model.dart';

class RentStatusListWidget extends StatefulWidget {
  const RentStatusListWidget({super.key});

  @override
  State<RentStatusListWidget> createState() => _RentStatusListWidgetState();
}

class _RentStatusListWidgetState extends State<RentStatusListWidget>
    with TickerProviderStateMixin {
  late RentApplyListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  void getSuppliesRoomData() async{
    await _model.getSuppliesRoomData();
    _model.getSuppliesData = true;
    setState(() {});
  }

  @override
  void initState(){
    super.initState();
    _model = createModel(context, () => RentApplyListModel());

    _model.searchBarTextController ??= TextEditingController();
    _model.searchBarFocusNode ??= FocusNode();

    _model.suppliesAmountTextController ??= TextEditingController();
    _model.suppliesAmountFocusNode ??= FocusNode();

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
              '물품 추가/수정',
              style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Pretendard',
                letterSpacing: 0.0,
                useGoogleFonts: false,
              ),
            ),
            actions: [
              Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                  child: InkWell(
                    onTap: () async {
                      if(_model.getSuppliesData == true) {
                        await _model.addModifySuppliesButtonOnTap(context);
                        setState(() {});
                      }
                    },
                    child: const Icon(
                      Icons.add_rounded,
                      color: Colors.grey,
                      size: 24,
                    ),
                  )
              ),
            ],
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
                          setState(() {
                            _model.searchTarget
                            = (_model.searchBarTextController.text.isEmpty)? null:_model.searchBarTextController.text;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                if(_model.getSuppliesData == false)
                  const CircularProgressIndicator()
                else
                  Flexible(
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            for(int i = 0; i < suppliesRoomInfo.name.length; i++)
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
                                            suppliesRoomInfo.imageUrl[i],
                                            width: 120.0,
                                            height: 70.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(
                                              16.0, 0.0, 0.0, 0.0),
                                          child: Text(
                                            suppliesRoomInfo.name[i],
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
                                            Text(
                                                '수량: ${suppliesRoomInfo.amount[i]??'입력되지 않음'}\n'
                                                    '대여 가능 수량: ${suppliesRoomInfo.availableAmount[i]??'입력되지 않음'}'
                                            ),
                                            const SizedBox(width: 16),
                                            FFButtonWidget(
                                              onPressed: () {
                                                _model.showMapButtonOnTap(context, i);
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
                                                await modifySupplies(context, i);
                                                setState(() {});
                                              },
                                              text: '수정',
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
                          ],
                        ),
                      ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> modifySupplies(BuildContext context, int index) {
    _model.checkIsInputAmountValue = true;

    return showCupertinoDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('수정/삭제'),
          actions: [
            Center(
              child: Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: SwitchListTile.adaptive(
                      value: _model.checkIsInputAmountValue,
                      onChanged: (newValue) async {
                        safeSetState(() =>
                        _model.checkIsInputAmountValue =
                            newValue);
                      },
                      title: Text(
                        '수량 저장 여부',
                        style: FlutterFlowTheme.of(context)
                            .titleLarge
                            .override(
                          fontFamily:
                          FlutterFlowTheme.of(context)
                              .titleLargeFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts: GoogleFonts
                              .asMap()
                              .containsKey(
                              FlutterFlowTheme.of(
                                  context)
                                  .titleLargeFamily),
                        ),
                      ),
                      subtitle: Text(
                        '물품의 수량도 저장할 예정인가요?',
                        style: FlutterFlowTheme.of(context)
                            .labelMedium
                            .override(
                          fontFamily:
                          FlutterFlowTheme.of(context)
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
                      tileColor: FlutterFlowTheme.of(context)
                          .secondaryBackground,
                      activeColor: FlutterFlowTheme.of(context)
                          .alternate,
                      activeTrackColor:
                      FlutterFlowTheme.of(context).primary,
                      dense: false,
                      controlAffinity:
                      ListTileControlAffinity.trailing,
                    ),
                  ),
                  TextFormField(
                    controller:
                    _model.suppliesAmountTextController,
                    focusNode: _model.suppliesAmountFocusNode,
                    autofocus: true,
                    textCapitalization:
                    TextCapitalization.words,
                    obscureText: false,
                    enabled: (_model.checkIsInputAmountValue)? true:false,
                    decoration: InputDecoration(
                      labelText: '수량',
                      labelStyle: FlutterFlowTheme.of(context)
                          .labelLarge
                          .override(
                        fontFamily:
                        FlutterFlowTheme.of(context)
                            .labelLargeFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap()
                            .containsKey(
                            FlutterFlowTheme.of(context)
                                .labelLargeFamily),
                      ),
                      hintStyle: FlutterFlowTheme.of(context)
                          .labelMedium
                          .override(
                        fontFamily:
                        FlutterFlowTheme.of(context)
                            .labelMediumFamily,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap()
                            .containsKey(
                            FlutterFlowTheme.of(context)
                                .labelMediumFamily),
                      ),
                      errorStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                        fontFamily:
                        FlutterFlowTheme.of(context)
                            .bodyMediumFamily,
                        color: FlutterFlowTheme.of(context)
                            .error,
                        fontSize: 12,
                        letterSpacing: 0.0,
                        useGoogleFonts: GoogleFonts.asMap()
                            .containsKey(
                            FlutterFlowTheme.of(context)
                                .bodyMediumFamily),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context)
                              .alternate,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context)
                              .primary,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context)
                              .error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context)
                              .error,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      filled: true,
                      fillColor: (_model.suppliesAmountFocusNode
                          ?.hasFocus ??
                          false)
                          ? FlutterFlowTheme.of(context).accent1
                          : FlutterFlowTheme.of(context)
                          .secondaryBackground,
                      contentPadding:
                      const EdgeInsetsDirectional.fromSTEB(
                          16, 20, 16, 20),
                    ),
                    style: FlutterFlowTheme.of(context)
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
                    cursorColor:
                    FlutterFlowTheme.of(context).primary,
                    validator: _model
                        .suppliesAmountTextControllerValidator
                        .asValidator(context),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}