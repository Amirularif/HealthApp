import 'package:flutter/cupertino.dart';
import 'package:healthapp/calendar.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/graph.dart';
import 'package:healthapp/profile.dart';
import 'package:healthapp/surveymain.dart';

class DashboardPage extends StatelessWidget{
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child : Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text('Main Menu'),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 23.0,
              fontWeight: FontWeight.bold),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(icon :Image.asset('assets/with welcome.png'),
                padding: EdgeInsets.all(5),
                constraints: BoxConstraints.expand(width: 200, height: 600),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => profilePage()),
                  );
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(icon: Image.asset('assets/top widget.png'),
                    iconSize: 153,
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Calendar()),
                      );
                    },
                  ),
                  IconButton(icon: Image.asset('assets/bottom widget.png'),
                    iconSize: 153,
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => graphPage()),
                      );
                    },
                  ),
                  IconButton(icon: Image.asset('assets/GAD7.png'),
                    iconSize: 153,
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SurveyMainPage()),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}