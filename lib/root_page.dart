import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main_vc.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _init();
  }

  _init() async {
    await Future.delayed(
      Duration(
        milliseconds: 2000,
      ),
    );
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => MainVC(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFff6962),
      body: Center(
        child: Text(
          'Charts!',
          style: GoogleFonts.varela(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
