import 'package:flutter/cupertino.dart';
import 'package:healthapp/calendar.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/graph.dart';
import 'package:healthapp/GAD-7 survey/surveymain.dart';
import 'package:healthapp/student survey/studentsurveymain.dart';
import 'Profile/profile_page.dart';
import 'Profile/profilemain.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardPage extends StatelessWidget{
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // make sure no overflow when keyboard appears
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        elevation: 5,
        actions: [
          Icon(Icons.more_vert),
        ],
        iconTheme: IconThemeData(
          color: Colors.grey.shade800,
        ),
        title: Text('Main Menu',
        style: GoogleFonts.pacifico(),
        ),
        titleTextStyle: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 25.0),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 600,
              width: 210,
              child: IconButton(icon :Image.asset('assets/userprofile.png'),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileMain()),
                  );
                },
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(
                  height: 140,
                  width: 136,
                  child :IconButton(icon: Image.asset('assets/moodlog.png'),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Calendar()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 140,
                  width: 136,
                  child :IconButton(icon: Image.asset('assets/stats.png'),
                    iconSize: 120,
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => graphPage()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 140,
                  width: 136,
                  child :IconButton(icon: Image.asset('assets/gad7 (1).png'),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SurveyMainPage()),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height:100,
                  width:136,
                  child: IconButton(icon: Image.asset('assets/solmun.png'),
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => StudentSurveyMainPage()),
                      );
                    },
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