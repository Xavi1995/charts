import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graph_things/utils/styles.dart';

class ValuesPage extends StatefulWidget {
  @override
  _ValuesPageState createState() => _ValuesPageState();
}

class _ValuesPageState extends State<ValuesPage> {
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();

  StreamController<bool> loading = StreamController<bool>.broadcast();
  TextEditingController valor1 = TextEditingController();
  TextEditingController valor2 = TextEditingController();
  TextEditingController valor3 = TextEditingController();
  TextEditingController valor4 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    List<CircularStackEntry> data = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(500.0, Colors.red[200], rankKey: 'Q1'),
          new CircularSegmentEntry(1000.0, Colors.green[200], rankKey: 'Q2'),
          new CircularSegmentEntry(2000.0, Colors.blue[200], rankKey: 'Q3'),
          new CircularSegmentEntry(1000.0, Colors.yellow[200], rankKey: 'Q4'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    ];

    return Stack(
      children: <Widget>[
        Scaffold(
          appBar: AppBar(
            backgroundColor: Style.primaryColor,
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Elegir valores',
              style: GoogleFonts.varela(
                color: Colors.white,
              ),
            ),
            centerTitle: true,
            elevation: 0,
          ),
          backgroundColor: Style.backgroundColor,
          body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight,
                  ),
                  child: SafeArea(
                    child: Container(
                      child: Column(
                        children: <Widget>[
                          SizedBox(height: 20),
                          Style.textFieldWithLabel('Valor 1', valor1, context),
                          AnimatedCircularChart(
                            key: _chartKey,
                            size: const Size(300.0, 300.0),
                            initialChartData: data,
                            chartType: CircularChartType.Radial,
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
                    valueColor: AlwaysStoppedAnimation(
                      Style.primaryColor,
                    ),
                  ),
                );
              }
            })
      ],
    );
  }

  void _cycleSamples() {
    List<CircularStackEntry> nextData = <CircularStackEntry>[
      new CircularStackEntry(
        <CircularSegmentEntry>[
          new CircularSegmentEntry(1500.0, Colors.red[200], rankKey: 'Q1'),
          new CircularSegmentEntry(750.0, Colors.green[200], rankKey: 'Q2'),
          new CircularSegmentEntry(2000.0, Colors.blue[200], rankKey: 'Q3'),
          new CircularSegmentEntry(1000.0, Colors.yellow[200], rankKey: 'Q4'),
        ],
        rankKey: 'Quarterly Profits',
      ),
    ];
    setState(() {
      _chartKey.currentState.updateData(nextData);
    });
  }
}
