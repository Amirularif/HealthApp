import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthapp/student survey/quiz.dart';
import 'package:healthapp/student survey/result.dart';

class StudentSurveyMainPage extends StatefulWidget {
  const StudentSurveyMainPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _StudentSurveyMainPageState();
  }
}

class _StudentSurveyMainPageState extends State<StudentSurveyMainPage> {
  final _questions = const [
    {
      'questionText': 'Q1. 뚜릇한 이유 없이 여기저기 자주 아프다?',
      'answers': [
        {'text': '전혀 아니다', 'score': 0},
        {'text': '조금 그렇다', 'score': 1},
        {'text': '그렇다', 'score': 2},
        {'text': '매우 그렇다', 'score': 3},
      ],
    },
    {
      'questionText': 'Q2. 이유 없이 감정기복이 심하다?',
      'answers': [
        {'text': '전혀 아니다', 'score': 0},
        {'text': '조금 그렇다', 'score': 1},
        {'text': '그렇다', 'score': 2},
        {'text': '매우 그렇다', 'score': 3},
      ],
    },
    {
      'questionText': ' Q3. 모든 것이 귀찮고 재미가 없다?',
      'answers': [
        {'text': '전혀 아니다', 'score': 0},
        {'text': '조금 그렇다', 'score': 1},
        {'text': '그렇다', 'score': 2},
        {'text': '매우 그렇다', 'score': 3},
      ],
    },
    {
      'questionText': 'Q4. 괜한 걱정을 미리 한다?',
      'answers': [
        {'text': '전혀 아니다', 'score': 0},
        {'text': '조금 그렇다', 'score': 1},
        {'text': '그렇다', 'score': 2},
        {'text': '매우 그렇다', 'score': 3},
      ],
    },
    {
      'questionText': 'Q5. 어른들이 이래라 저래라 하면 짜증이 난다?',
      'answers': [
        {'text': '전혀 아니다', 'score': 0},
        {'text': '조금 그렇다', 'score': 1},
        {'text': '그렇다', 'score': 2},
        {'text': '매우 그렇다', 'score': 3},
      ],
    },
    {
      'questionText': 'Q6. 죽고 싶다는 생각이 든다?',
      'answers': [
        {'text': '전혀 아니다', 'score': 0},
        {'text': '조금 그렇다', 'score': 1},
        {'text': '그렇다', 'score': 2},
        {'text': '매우 그렇다', 'score': 3},
      ],
    },
    {
      'questionText': 'Q7. 이유 없이 우울하거나 짜증이 난다?',
      'answers': [
        {'text': '전혀 아니다', 'score': 0},
        {'text': '조금 그렇다', 'score': 1},
        {'text': '그렇다', 'score': 2},
        {'text': '매우 그렇다', 'score': 3},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
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
          title: Text('학생 정서 행동 특성 검사',
          style: GoogleFonts.pacifico(),
        ),
        titleTextStyle: TextStyle(
            color: Colors.grey.shade800,
            fontSize: 20.0),
        centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions,
          ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ); //Scaffold
  }
}
