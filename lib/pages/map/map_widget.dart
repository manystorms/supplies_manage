import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    .labelMedium
                    .override(
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
              ),
            ),
            for(int i = 1; i <= 4; i++)
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular((i == 4)? 25:0),
                          bottomRight: Radius.circular((i == 4)? 25:0),
                          topLeft: Radius.circular((i == 1)? 25:0),
                          topRight: Radius.circular((i == 1)? 25:0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 5,
                        ),
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
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular((i == 4)? 25:0),
                          bottomRight: const Radius.circular(0),
                          topLeft: Radius.circular((i == 1)? 25:0),
                          topRight: const Radius.circular(0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 5,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: const Radius.circular(0),
                          bottomRight: Radius.circular((i == 4)? 25:0),
                          topLeft: const Radius.circular(0),
                          topRight: Radius.circular((i == 1)? 25:0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 5,
                        ),
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
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular((i == 4)? 25:0),
                          bottomRight: Radius.circular((i == 4)? 25:0),
                          topLeft: Radius.circular((i == 1)? 25:0),
                          topRight: Radius.circular((i == 1)? 25:0),
                        ),
                        border: Border.all(
                          color: Colors.black,
                          width: 5,
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
