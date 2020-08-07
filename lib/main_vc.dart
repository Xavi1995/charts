import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graph_things/pages/choose_pages_value.dart';
import 'package:graph_things/utils/styles.dart';

class MainVC extends StatefulWidget {
  @override
  MainVCState createState() => MainVCState();
}

class MainVCState extends State<MainVC> {
  StreamController<bool> loading = StreamController<bool>.broadcast();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Scaffold(
          backgroundColor: Color(0xFFf4f4f4),
          appBar: AppBar(
            backgroundColor: Color(0xFFf4f4f4),
            elevation: 0,
            centerTitle: true,
            title: Text(
              'Charts!',
              style: GoogleFonts.varela(
                color: Style.primaryColor,
              ),
            ),
          ),
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: SafeArea(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.0,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ValuesPage(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Line',
                                style: GoogleFonts.varela(
                                  color: Style.primaryColor,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              side: BorderSide(
                                color: Style.primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          FlatButton(
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Doughnut',
                                style: GoogleFonts.varela(
                                  color: Style.primaryColor,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              side: BorderSide(
                                color: Style.primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          FlatButton(
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Radial bar',
                                style: GoogleFonts.varela(
                                  color: Style.primaryColor,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              side: BorderSide(
                                color: Style.primaryColor,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          FlatButton(
                            onPressed: () {},
                            child: Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Spline area',
                                style: GoogleFonts.varela(
                                  color: Style.primaryColor,
                                ),
                              ),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4),
                              ),
                              side: BorderSide(
                                color: Style.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        StreamBuilder(
            initialData: false,
            stream: loading.stream,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData == false || snapshot.data == false) {
                return Container();
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Color(0xFFff6962)),
                  ),
                );
              }
            })
      ],
    );
  }
}
