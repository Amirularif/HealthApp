import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class profilePage extends StatefulWidget {
  const profilePage({Key? key}) : super(key: key);

  @override
  _profilePageState createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Profile"),
          titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 23.0,
              fontWeight: FontWeight.bold),
          centerTitle: true,
        ),
        body: Center(
        child :Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0,0 ,50),
              child: Stack(
                children: <Widget>[
                  CircleAvatar(
                    radius: 70,
                    child: ClipOval(child: Image.asset('assets/profile.png', height: 150, width: 150, fit: BoxFit.cover,),),
                  ),
                  Positioned(bottom: 1, right: 1 ,child: Container(
                    height: 40, width: 40,
                    child: Icon(Icons.add_a_photo, color: Colors.white,),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.all(Radius.circular(20))
                    ),
                  ))
                ],
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 25, 20, 4),
                  child: Container(
                    height: 60,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: TextField(decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(width:2.0,color: Colors.indigo)
                          ),
                          hintText: 'Name',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ), style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: new BorderSide(width:2.0,color: Colors.indigo)
                          ),
                          hintText: 'Age',
                          prefixIcon: const Icon(
                            Icons.assessment,
                            color: Colors.black,
                          ),
                        ), style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: new BorderSide(width:2.0,color: Colors.indigo)
                          ),
                          hintText: 'Weight',
                          prefixIcon: const Icon(
                            Icons.whatshot_sharp,
                            color: Colors.black,
                          ),
                        ), style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 5, 20, 4),
                  child: Container(
                    height: 60,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              borderSide: new BorderSide(width:2.0,color: Colors.indigo)
                          ),
                          hintText: 'Gender',
                          prefixIcon: const Icon(
                            Icons.wc,
                            color: Colors.black,
                          ),
                        ), style: TextStyle(color: Colors.black),),
                      ),
                    ),
                  ),
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
