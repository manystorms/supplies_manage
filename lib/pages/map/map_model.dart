import '/flutter_flow/flutter_flow_util.dart';
import 'map_widget.dart' show MapWidget;
import 'package:flutter/material.dart';


class MapModel extends FlutterFlowModel<MapWidget> {
  bool getLocationMode = false;
  int choiceColumn = 0;
  int choiceRow = 0;
  int choiceFloor = 0;

  void processLocationData(String locationData) {
    if(locationData == 'getLocationMode') {
      getLocationMode = true; return;
    }

    List<String> parts = locationData.split('-');
    choiceColumn = int.parse(parts[0]);
    choiceRow = int.parse(parts[1]);
    choiceFloor = int.parse(parts[2]);
  }

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
