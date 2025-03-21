import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'rent_apply_list_model.dart';
export 'rent_apply_list_model.dart';

class RentApplyListWidget extends StatefulWidget {
  const RentApplyListWidget({super.key});

  @override
  State<RentApplyListWidget> createState() => _RentApplyListWidgetState();
}

class _RentApplyListWidgetState extends State<RentApplyListWidget>
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
                          setState(() {});
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
                              if(suppliesRoomInfo.suppliesSearch(i, _model.searchBarTextController.text))
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
                                            child: SizedBox(
                                              width: 80,
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
                                                    '수량: ${suppliesRoomInfo.amount[i]??'입력x'}\n'
                                                        '대여 가능 수량: ${suppliesRoomInfo.availableAmount[i]??'입력x'}'
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
                                                  onPressed: () async {
                                                    await context.push('/rentsupplies/$i');
                                                    setState(() {});
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
                                            ):
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Text(
                                                  '수량: ${suppliesRoomInfo.amount[i]??'입력x'}\n'
                                                      '대여 가능 수량: ${suppliesRoomInfo.availableAmount[i]??'입력x'}'
                                              ),
                                              FFButtonWidget(
                                                onPressed: () {
                                                  _model.showMapButtonOnTap(context, i);
                                                },
                                                text: '위치',
                                                options: FFButtonOptions(
                                                  width: 75.0,
                                                  height: 40.0,
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
                                              const SizedBox(height: 7.0),
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  await context.push('/rentsupplies/$i');
                                                  setState(() {});
                                                },
                                                text: '신청',
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
                      ),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
