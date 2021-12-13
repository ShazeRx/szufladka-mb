import 'package:szufladka/book_borrowed/book_borrowed_widget.dart';

import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SzufladkaBookDetailsWidget extends StatefulWidget {
  const SzufladkaBookDetailsWidget({
    Key key,
    this.bookDetails,
  }) : super(key: key);

  final dynamic bookDetails;

  @override
  _SzufladkaBookDetailsWidgetState createState() =>
      _SzufladkaBookDetailsWidgetState();
}

class _SzufladkaBookDetailsWidgetState
    extends State<SzufladkaBookDetailsWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.primaryColor,
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF4B39EF),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 30,
                              borderWidth: 1,
                              buttonSize: 60,
                              icon: Icon(
                                Icons.keyboard_arrow_left_sharp,
                                color: FlutterFlowTheme.tertiaryColor,
                                size: 30,
                              ),
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                            )
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Image.asset(
                              'assets/images/lt22301254_quantized.png',
                              width: MediaQuery.of(context).size.width,
                              height: 350,
                              fit: BoxFit.fitHeight,
                            )
                          ],
                        ),
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                getJsonField(widget.bookDetails, r'''$.tytul''')
                                    .toString(),
                                style: FlutterFlowTheme.title1.override(
                                  fontFamily: 'Poppins',
                                  color: FlutterFlowTheme.tertiaryColor,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 8),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 12, 0, 0),
                                  child: Text(
                                    functions.formatAuthor(getJsonField(
                                            widget.bookDetails, r'''$.autor''')
                                        .toString()),
                                    textAlign: TextAlign.center,
                                    style: FlutterFlowTheme.bodyText2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Color(0xFF8B97A2),
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Szczegóły',
                        style: FlutterFlowTheme.title2,
                      )
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Wydawnictwo:',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                                Text(
                                  getJsonField(widget.bookDetails,
                                          r'''$.wydawnictwo''')
                                      .toString(),
                                  style: FlutterFlowTheme.bodyText1,
                                )
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rok Wydania: ',
                                  style: FlutterFlowTheme.bodyText1,
                                ),
                                Text(
                                  getJsonField(widget.bookDetails,
                                          r'''$.rok_wydania''')
                                      .toString(),
                                  style: FlutterFlowTheme.bodyText1,
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Material(
                    color: Colors.transparent,
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Color(0xFF4B39EF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 1, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return AlertDialog(
                                  title: Text('Wypożyczanie'),
                                  content:
                                      Text('Potwierdź wypożyczenie pozycji'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(alertDialogContext),
                                      child: Text('Anuluj'),
                                    ),
                                    TextButton(
                                      onPressed: () async {
                                        Navigator.pop(alertDialogContext);
                                        await borrowBookCall(
                                            getJsonField(widget.bookDetails,
                                                r'''$.indeks''')
                                        );
                                        await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                BookBorrowedWidget(
                                                  tytul: getJsonField(widget.bookDetails,
                                                      r'''$.tytul'''),
                                                  autor: getJsonField(widget.bookDetails,
                                                      r'''$.autor'''),
                                                ),
                                          ),
                                        );

                                        ;
                                      },
                                      child: Text('Potwierdź'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          text: 'Wypożycz',
                          options: FFButtonOptions(
                            color: Color(0xFF4B39EF),
                            textStyle: FlutterFlowTheme.subtitle2.override(
                              fontFamily: 'Lexend Deca',
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: 8,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
