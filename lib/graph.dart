import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class graphPage extends StatefulWidget {
  const graphPage({Key? key}) : super(key: key);

  @override
  _graphPageState createState() => _graphPageState();
}

class _graphPageState extends State<graphPage> {
  List<MoodData> chartData = [];

  Future loadMoodData() async {
    final String jsonString = await getJsonFromAssets();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse) {
      chartData.add(MoodData.fromJson(i));
    }
  }

  Future<String> getJsonFromAssets() async {
    return await rootBundle.loadString('assets/data.json');
  }

  @override
  void initState() {
    loadMoodData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false, // make sure no overflow when keyboard appears
        backgroundColor: Colors.grey.shade100,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade100,
          elevation: 5,
          iconTheme: IconThemeData(
            color: Colors.grey.shade800,
          ),
          title: Text('Mood statistics',
            style: GoogleFonts.pacifico(),
          ),
          titleTextStyle: TextStyle(
              color: Colors.grey.shade800,
              fontSize: 25.0),
          centerTitle: true,
        ),
        body: Center(
            child: FutureBuilder(
                future: getJsonFromAssets(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SfCircularChart(
                      legend: Legend(
                          isVisible: true,
                          offset: const Offset(0, 320),
                        title: LegendTitle(
                          text:'Weekly Mood Statistics',
                          textStyle: const TextStyle(
                              color: Colors.indigo,
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.w900
                              ),
                        )
                      ),
                        series: <CircularSeries>[
                          DoughnutSeries<MoodData,String>(
                            dataSource: chartData,
                            dataLabelSettings: const DataLabelSettings(isVisible:true),
                            xValueMapper: (MoodData sales, _) => sales.mood,
                            yValueMapper: (MoodData sales, _) => sales.scale,
                            innerRadius: '70%',
                            startAngle: 270,
                            endAngle: 90
                          )
                          ]
                    );
                  } else {
                    return Card(
                      elevation: 5.0,
                      child: Container(
                        height: 100,
                        width: 400,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              const Text('Retriving JSON data...',
                                  style: TextStyle(fontSize: 20.0)),
                              Container(
                                height: 40,
                                width: 40,
                                child: CircularProgressIndicator(
                                  semanticsLabel: 'Retriving JSON data',
                                  valueColor: const AlwaysStoppedAnimation<Color>(
                                      Colors.blueAccent),
                                  backgroundColor: Colors.grey[300],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }
                }
                )
              )
            );
    }
}

class MoodData {
  MoodData(this.mood, this.scale);

  final String mood;
  final double scale;

  factory MoodData.fromJson(Map<String, dynamic> parsedJson) {
    return MoodData(
      parsedJson['mood'].toString(),
      parsedJson['scale'],
    );
  }
}