import 'package:lottie/lottie.dart';

import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../my_book_details/my_book_details_widget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBooksWidget extends StatefulWidget {
  const MyBooksWidget({Key key}) : super(key: key);

  @override
  _MyBooksWidgetState createState() => _MyBooksWidgetState();
}

class _MyBooksWidgetState extends State<MyBooksWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF090F13),
        automaticallyImplyLeading: false,
        title: Text(
          'Moje książki',
          style: FlutterFlowTheme.title1,
        ),
        actions: [],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: Color(0xFF262D34),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
          child: FutureBuilder<ApiCallResponse>(
            future: getMyBooksCall(),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50,
                    height: 50,
                    child: CircularProgressIndicator(
                      color: FlutterFlowTheme.secondaryColor,
                    ),
                  ),
                );
              }
              final gridViewGetMyBooksResponse = snapshot.data;
              return Builder(
                builder: (context) {
                  final book = getJsonField(
                              gridViewGetMyBooksResponse.jsonBody, r'''$.''')
                          ?.toList() ??
                      [];
                  if (book.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Nie masz wypożyczonych żadnych książek",
                              style: FlutterFlowTheme.bodyText2.override(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              )),
                          Lottie.asset(
                            'assets/lottie_animations/empty_result.json',
                            width: 150,
                            height: 130,
                            fit: BoxFit.cover,
                            animate: true,
                          )
                        ],
                      ),
                    );
                  }
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 150,
                      childAspectRatio: 1,
                    ),
                    scrollDirection: Axis.vertical,
                    itemCount: book.length,
                    itemBuilder: (context, bookIndex) {
                      final bookItem = book[bookIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                        child: InkWell(
                          onTap: () async {
                            await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MyBookDetailsWidget(
                                  bookDetails: bookItem,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0x00EEEEEE),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.asset(
                                      'assets/images/lt22301254_quantized.png',
                                      width: 100,
                                      height: 150,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: Text(
                                        getJsonField(bookItem, r'''$.tytul''')
                                            .toString(),
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style:
                                            FlutterFlowTheme.bodyText1.override(
                                          fontFamily: 'Poppins',
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      getJsonField(bookItem, r'''$.autor''')
                                          .toString(),
                                      style: FlutterFlowTheme.bodyText1.override(
                                        fontFamily: 'Poppins',
                                        color: Color(0xFFCEC2C2),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
