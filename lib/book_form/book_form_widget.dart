import 'package:szufladka/book_added/book_added_widget.dart';

import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookFormWidget extends StatefulWidget {
  const BookFormWidget({Key key}) : super(key: key);

  @override
  _BookFormWidgetState createState() => _BookFormWidgetState();
}

class _BookFormWidgetState extends State<BookFormWidget>
    with TickerProviderStateMixin {
  TextEditingController autorController;
  TextEditingController tytulController;
  TextEditingController wydawnictwoController;
  TextEditingController riokWydaniaController;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'textFieldOnPageLoadAnimation1': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 170,
      fadeIn: true,
      slideOffset: Offset(0, -80),
    ),
    'textFieldOnPageLoadAnimation2': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 170,
      fadeIn: true,
      slideOffset: Offset(0, -80),
    ),
    'textFieldOnPageLoadAnimation3': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 230,
      fadeIn: true,
      slideOffset: Offset(0, -120),
    ),
    'textFieldOnPageLoadAnimation4': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: 170,
      fadeIn: true,
      slideOffset: Offset(0, -80),
    ),
  };

  @override
  void initState() {
    super.initState();
    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );

    autorController = TextEditingController();
    tytulController = TextEditingController();
    wydawnictwoController = TextEditingController();
    riokWydaniaController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.primaryColor,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Material(
              color: Colors.transparent,
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Dodaj Książkę',
                            style: FlutterFlowTheme.title1.override(
                              fontFamily: 'Poppins',
                              color: Color(0xFF090F13),
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              Navigator.pop(context);
                            },
                            child: Card(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              color: Color(0xFFDBE2E7),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                buttonSize: 48,
                                icon: Icon(
                                  Icons.close_rounded,
                                  color: Color(0xFF95A1AC),
                                  size: 30,
                                ),
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: TextFormField(
                          onChanged: (_) => EasyDebounce.debounce(
                            'tytulController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          controller: tytulController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Tytuł',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 24, 24),
                            suffixIcon: tytulController.text.isNotEmpty
                                ? InkWell(
                                    onTap: () => setState(
                                      () => tytulController.clear(),
                                    ),
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF8B97A2),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 1,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Tytul jest wymagany';
                            }

                            return null;
                          },
                        ).animated(
                            [animationsMap['textFieldOnPageLoadAnimation1']]),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: TextFormField(
                          onChanged: (_) => EasyDebounce.debounce(
                            'autorController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          controller: autorController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Autor',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 24, 24),
                            suffixIcon: autorController.text.isNotEmpty
                                ? InkWell(
                                    onTap: () => setState(
                                      () => autorController.clear(),
                                    ),
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF8B97A2),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          maxLines: 1,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Autor jest wymagany';
                            }

                            return null;
                          },
                        ).animated(
                            [animationsMap['textFieldOnPageLoadAnimation2']]),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: TextFormField(
                          onChanged: (_) => EasyDebounce.debounce(
                            'wydawnictwoController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          controller: wydawnictwoController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Wydawnictwo',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            suffixIcon: wydawnictwoController.text.isNotEmpty
                                ? InkWell(
                                    onTap: () => setState(
                                      () => wydawnictwoController.clear(),
                                    ),
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.bodyText1.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF1E2429),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          textAlign: TextAlign.start,
                          maxLines: 1,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Wydawnictwo jest wymagane';
                            }

                            return null;
                          },
                        ).animated(
                            [animationsMap['textFieldOnPageLoadAnimation3']]),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                        child: TextFormField(
                          onChanged: (_) => EasyDebounce.debounce(
                            'riokWydaniaController',
                            Duration(milliseconds: 2000),
                            () => setState(() {}),
                          ),
                          controller: riokWydaniaController,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Rok wydania',
                            labelStyle: FlutterFlowTheme.bodyText1.override(
                              fontFamily: 'Lexend Deca',
                              color: Color(0xFF090F13),
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0xFFDBE2E7),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            contentPadding:
                                EdgeInsetsDirectional.fromSTEB(20, 24, 24, 24),
                            suffixIcon: riokWydaniaController.text.isNotEmpty
                                ? InkWell(
                                    onTap: () => setState(
                                      () => riokWydaniaController.clear(),
                                    ),
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.bodyText2.override(
                            fontFamily: 'Lexend Deca',
                            color: Color(0xFF8B97A2),
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                          ),
                          keyboardType: TextInputType.number,
                          validator: (val) {
                            if (val.isEmpty) {
                              return 'Rok wydania jest wymagany';
                            }

                            return null;
                          },
                        ).animated(
                            [animationsMap['textFieldOnPageLoadAnimation4']]),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          if (!formKey.currentState.validate()) {
                            return;
                          }
                          await createBookCall(
                            tytul: tytulController.text,
                            autor: autorController.text,
                            rokWydania: int.parse(riokWydaniaController.text),
                            wydawnictwo: wydawnictwoController.text,
                          );
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BookAddedWidget(
                                  tytul: tytulController.text,
                                  autor: autorController.text,
                                ),
                              ),
                            );


                        },
                        text: 'Dodaj książkę do zbioru',
                        options: FFButtonOptions(
                          width: 300,
                          height: 70,
                          color: FlutterFlowTheme.primaryColor,
                          textStyle: FlutterFlowTheme.title1.override(
                            fontFamily: 'Lexend Deca',
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                          elevation: 0,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Text(
              'Kliknij wyżej aby potwierdzić dodawanie',
              style: FlutterFlowTheme.bodyText1.override(
                fontFamily: 'Lexend Deca',
                color: FlutterFlowTheme.tertiaryColor,
                fontSize: 14,
                fontWeight: FontWeight.normal,
              ),
            )
          ],
        ),
      ),
    );
  }
}
