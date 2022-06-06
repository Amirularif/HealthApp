import 'package:google_fonts/google_fonts.dart';
import 'package:healthapp/event.dart';
import 'package:flutter/material.dart';
import 'package:healthapp/mood.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late Map<DateTime, List<Event>> selectedEvents;
  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();

  TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};
    super.initState();
  }

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
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
        title: Text("Mood Tracker",
          style: GoogleFonts.pacifico(),),
        titleTextStyle: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 23.0),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          children: [
            TableCalendar(
              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,

              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(focusedDay);
              },
              selectedDayPredicate: (DateTime date) {
                return isSameDay(selectedDay, date);
              },

              eventLoader: _getEventsfromDay,

              //To style the Calendar
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.indigo,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.indigo,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            ..._getEventsfromDay(selectedDay).map(
                  (Event event) =>
                      ListTile(
                    title: Text(event.title),
              ),
            ),
            Container(height: 50),
            Text(" How do you feel today?",style:TextStyle(color: Colors.black,
                fontSize: 15.0,
                fontWeight: FontWeight.bold)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  IconButton(icon: Image.asset('assets/angry.png'),
                      iconSize:40,
                      onPressed: (){
                        if(selectedEvents[selectedDay] != null){
                          selectedEvents[selectedDay]?.add(
                            Event(title: 'Angry'),
                          );
                        }else{
                          selectedEvents[selectedDay] = [
                            Event(title: 'Angry')];
                        }
                        setState((){});
                        return;
                     }),
                  IconButton(icon: Image.asset('assets/stressed.png'),
                      iconSize:40,
                      onPressed: (){
                        if(selectedEvents[selectedDay] != null){
                          selectedEvents[selectedDay]?.add(
                            Event(title: 'Stress'),
                          );
                        }else{
                          selectedEvents[selectedDay] = [
                            Event(title: 'Stress')];
                        }
                        setState((){});
                        return;
                      }),
                  IconButton(icon: Image.asset('assets/sad.png'),
                      iconSize:40,
                      onPressed: (){
                        if(selectedEvents[selectedDay] != null){
                          selectedEvents[selectedDay]?.add(
                            Event(title: 'Sad'),
                          );
                        }else{
                          selectedEvents[selectedDay] = [
                            Event(title: 'Sad')];
                        }
                        setState((){});
                        return;
                      }),
                  IconButton(icon: Image.asset('assets/calm.png'),
                      iconSize:40,
                      onPressed: (){
                        if(selectedEvents[selectedDay] != null){
                          selectedEvents[selectedDay]?.add(
                            Event(title: 'Calm'),
                          );
                        }else{
                          selectedEvents[selectedDay] = [
                            Event(title: 'Calm')];
                        }
                        setState((){});
                        return;
                      }),
                  IconButton(icon: Image.asset('assets/happy.png'),
                      iconSize:40,
                      onPressed: (){
                        if(selectedEvents[selectedDay] != null){
                          selectedEvents[selectedDay]?.add(
                            Event(title: 'Happy'),
                          );
                        }else{
                          selectedEvents[selectedDay] = [
                            Event(title: 'Happy')];
                        }
                        setState((){});
                        return;
                      })
                  ],
              ),
            ],
        ),
      ),
    );
  }
}