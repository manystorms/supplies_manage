import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'rent_log_model.dart';
export 'rent_log_model.dart';

class RentLogWidget extends StatefulWidget {
  const RentLogWidget({super.key});

  @override
  State<RentLogWidget> createState() => _RentLogWidgetState();
}

class _RentLogWidgetState extends State<RentLogWidget>
    with TickerProviderStateMixin {
  late RentLogModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  String? userName;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RentLogModel());

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
              '대여/반납 기록',
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
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    DropdownButton<int>(
                      value: _model.selectedYear,
                      onChanged: (int? newYear) {
                        setState(() {
                          _model.selectedYear = newYear!;
                        });
                      },
                      items: _model.years.map<DropdownMenuItem<int>>((int year) {
                        return DropdownMenuItem<int>(
                          value: year,
                          child: Text(year.toString()),
                        );
                      }).toList(),
                    ),
                    const SizedBox(width: 15,),
                    DropdownButton<int>(
                      value: _model.selectedMonth,
                      onChanged: (int? newMonth) {
                        setState(() {
                          _model.selectedMonth = newMonth!;
                        });
                      },
                      items: _model.months.map<DropdownMenuItem<int>>((int month) {
                        return DropdownMenuItem<int>(
                          value: month,
                          child: Text(month.toString().padLeft(2, '0')),
                        );
                      }).toList(),
                    ),
                    const SizedBox(width: 15,),
                    IconButton(
                        onPressed: () async {
                          await _model.getRentLogButtonOnTap(context);
                          setState(() {});
                        },
                        icon: const Icon(
                          Icons.manage_search
                        )
                    )
                  ],
                ),
                if(_model.getLogData == false)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else
                  Expanded(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(label: Text('대여 일자')),
                            DataColumn(label: Text('대여자')),
                            DataColumn(label: Text('대여 품목')),
                            DataColumn(label: Text('대여 수량')),
                            DataColumn(label: Text('반납 여부')),
                            DataColumn(label: Text('반납 일자')),
                          ],
                          rows: <DataRow>[
                            for(int i = 0; i < _model.logData.length; i++)
                              DataRow(cells: <DataCell>[
                                DataCell(Text(_model.logData[i]['rentDate'])),
                                DataCell(Text(_model.logData[i]['rentPerson'])),
                                DataCell(Text(_model.logData[i]['suppliesName'])),
                                DataCell(Text(_model.logData[i]['rentAmount'].toString())),
                                DataCell(Text((_model.logData[i]['returnComplete'])? '반납 완료':'대여 중')),
                                DataCell(Text(_model.logData[i]['returnDate']??'')),
                              ]),
                          ],
                        ),
                      ),
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
