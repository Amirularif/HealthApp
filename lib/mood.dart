import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/event.dart';
import 'package:healthapp/calendar.dart';

class HomePage extends StatefulWidget {
    const HomePage({Key? key}) : super(key: key);

    @override
    _HomePageState createState() => _HomePageState();
    }

    class _HomePageState extends State<HomePage> {


    @override
    Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, // make sure no overflow when keyboard appears
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
        title: Text("How do you feel today?"),
        titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 23.0,
        fontWeight: FontWeight.bold),
        centerTitle: true,
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(icon: Image.asset('assets/stressed.png'),
                iconSize:40,
                onPressed: (){
                  Event(title: 'Annoyed');
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Calendar()),
                  );
                }),
            IconButton(icon: Image.asset('assets/angry.png'),
                iconSize:40,
                onPressed: (){}),
            IconButton(icon: Image.asset('assets/sad.png'),
                iconSize:40,
                onPressed: (){}),
            IconButton(icon: Image.asset('assets/calm.png'),
                iconSize:40,
                onPressed: (){}),
            IconButton(icon: Image.asset('assets/happy.png'),
                iconSize:40,
                onPressed: (){})
            ],
          ),
        ),
      );
    }
}