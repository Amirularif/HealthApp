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
        title: Text("Mood Tracker"),
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 23.0,
            fontWeight: FontWeight.bold),
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
                isTodayHighlighted: false,
                selectedDecoration: BoxDecoration(
                  color: Colors.indigo,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  shape: BoxShape.circle,
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  IconButton(icon: Image.asset('assets/annoyed.png'),
                      iconSize:40,
                      onPressed: (){
                        if(selectedEvents[selectedDay] != null){
                          selectedEvents[selectedDay]?.add(
                            Event(title: 'Annoyed'),
                          );
                        }else{
                          selectedEvents[selectedDay] = [
                            Event(title: 'Annoyed')];
                        }
                        setState((){});
                        return;
                     }),
                  IconButton(icon: Image.asset('assets/angry.png'),
                      iconSize:40,
                      onPressed: (){
                        if(selectedEvents[selectedDay] != null){
                          selectedEvents[selectedDay]?.add(
                            Event(title: 'Annoyed'),
                          );
                        }else{
                          selectedEvents[selectedDay] = [
                            Event(title: 'Annoyed')];
                        }
                        setState((){});
                        return;
                      }),
                  IconButton(icon: Image.asset('assets/cry.png'),
                      iconSize:40,
                      onPressed: (){
                        if(selectedEvents[selectedDay] != null){
                          selectedEvents[selectedDay]?.add(
                            Event(title: 'Annoyed'),
                          );
                        }else{
                          selectedEvents[selectedDay] = [
                            Event(title: 'Annoyed')];
                        }
                        setState((){});
                        return;
                      }),
                  IconButton(icon: Image.asset('assets/really_happy.png'),
                      iconSize:40,
                      onPressed: (){
                        if(selectedEvents[selectedDay] != null){
                          selectedEvents[selectedDay]?.add(
                            Event(title: 'Annoyed'),
                          );
                        }else{
                          selectedEvents[selectedDay] = [
                            Event(title: 'Annoyed')];
                        }
                        setState((){});
                        return;
                      }),
                  IconButton(icon: Image.asset('assets/smile.png'),
                      iconSize:40,
                      onPressed: (){
                        if(selectedEvents[selectedDay] != null){
                          selectedEvents[selectedDay]?.add(
                            Event(title: 'Annoyed'),
                          );
                        }else{
                          selectedEvents[selectedDay] = [
                            Event(title: 'Annoyed')];
                        }
                        setState((){});
                        return;
                      })
                  ],
              ),
            ],
        ),
      ),
    ),
    );
  }
}