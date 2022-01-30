import 'dart:ffi';
import 'dart:math';
import 'package:scorekeeper/testcodeclass.dart';

import 'questionclass.dart';


import 'package:flutter/material.dart';

void main() {
  print('void main is called');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Is the following true?',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Colors.black,
        ),
        body: MyBodyApp(),
      ),
    );
  }
}

class MyBodyApp extends StatefulWidget {
  const MyBodyApp({Key? key}) : super(key: key);

  @override
  _MyBodyAppState createState() => _MyBodyAppState();
}

class _MyBodyAppState extends State<MyBodyApp> {

  //Variables

  bool questionsAreNotAdded = true;


  var questionClass = QuestionClass();
  var testCodeClass = TestCodeclass();

  void addQuestions(){
    print('----- addQuestions is called');
    
    if (questionsAreNotAdded) {
      String secretCode = testCodeClass.secretCode;
      print('The secret code is $secretCode');
      questionClass.addClassQuestion(
          q: 'You can lead a cow down stairs,but not upstairs.', a: false);
      questionClass.addClassQuestion(
          q: 'Approx. one quarter of the human bones are in the feet', a: true);
      questionClass.addClassQuestion(q: 'A slug\'s blood is green', a: true);
      questionClass.addClassQuestion(
          q: 'A \ and \' is a String in Android Studio', a: true);

      print('Both lists in questionClass : ');
      print('The questions :');
      print(questionClass.questionClassList);
      print('And the answers :');
      print(questionClass.answerClassList);

      questionsAreNotAdded = false;
      print('questionsAreNotAdded = $questionsAreNotAdded');
    } else {
      print('addQuestions is called, but this job is already done. ');

    }

  }



  List <Icon> scoreKeeper = [];
  /*
  List <List> questionAndAnswers = [
    ['You can lead a cow down stairs,but not upstairs.',
      'Approx. one quarter of the human bones are in the feet',
      'A slug\'s blood is green',
      'A \ and \' is a String in Android Studio'

    ],[
      false,
      true,
      true,
      true
    ]
  ];

  List <String> questions = [
    'You can lead a cow down stairs,but not upstairs.',
    'Approx. one quarter of the human bones are in the feet',
    'A slug\'s blood is green',
    'A \ and \' is a String in Android Studio'
  ];
  */
  //Functions
  int nextQuestion = 1;

  int pickQuestion(){
    print('----- pickQuestion is called');
    //int maxInt = questions.length;
    int maxInt = questionClass.questionClassList.length;
    print('maxInt = $maxInt');
    int randomInt = Random().nextInt(maxInt);
    print('randomInt = $randomInt');

    //questionClass.testFunc();
    return randomInt;
  }

  String question(int questionNumber){
    print('----- question is called');
    //List questionList = questionAndAnswers[0];
    //String thisQuestion = questionList[questionNumber];

    String thisQuestion = questionClass.questionClassList[questionNumber];

    print('thisQuestion = $thisQuestion');

    return thisQuestion;

  }

  bool rightAnswer(int questionNumber){
    print('----- rightAnswer is called');
    //List answerList = questionAndAnswers[1];
    //bool thisAnswer = answerList[questionNumber];

    bool thisAnswer = questionClass.answerClassList[questionNumber];

    print('thisAnswer = $thisAnswer');

    return thisAnswer;
  }

  void checkAnswer(int answerNumber, bool givenAnswer){
    print('----- checkAnswer is called');
    //List answerList = questionAndAnswers[1];
    //bool rightAnswerHere = answerList[answerNumber];

    bool rightAnswerHere = questionClass.answerClassList[answerNumber];
    if (givenAnswer==rightAnswerHere){
      print('answer is right');
      setState(() {
        scoreKeeper.add(Icon(Icons.check, color: Colors.green,),);
      });
    } else {
      print('answer is wrong');
        scoreKeeper.add(Icon(Icons.close, color: Colors.red,),);
    };

  }

  String firstQuestion(){
    print('----- firstQuestion is called');
    //addQuestions();
    print('firstQuestion is called');
    //addQuestions();
    nextQuestion = pickQuestion();
    //List questionList = questionAndAnswers[0];
    //String question = questionList[nextQuestion];

    String question = questionClass.questionClassList[nextQuestion];
    return question;
  }

  @override
  Widget build(BuildContext context) {
    addQuestions();
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.grey.shade900,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
              child: Center(
                child: Text(question(nextQuestion),
                style: TextStyle(
                  color: Colors.white,
                  ),
                ),
              ),
          ),
          Expanded(
            flex: 1,
              child: TextButton(
                onPressed: (){
                  print('true is pressed');
                  setState(() {
                    //scoreKeeper.add(Icon(Icons.check, color: Colors.green,),);
                    checkAnswer(nextQuestion,true);
                    nextQuestion = pickQuestion();
                    //question(nextQuestion);
                  });
                },
                child: Container(
                  width: 200.0,
                  height: 75.0,
                  color: Colors.green,
                  child: Center(
                    child: Text('true',
                    style: TextStyle(
                      color: Colors.white,
                    ),),
                  ),
                ),
              ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: (){
                print('false is pressed');
                setState(() {
                  //scoreKeeper.add(Icon(Icons.close,color: Colors.red,),);
                  //pickQuestion();
                  checkAnswer(nextQuestion,false);
                  nextQuestion = pickQuestion();
                  //question(nextQuestion);
                });
              },
              child: Container(
                width: 200.0,
                height: 75.0,
                color: Colors.red,
                child: Center(
                  child: Text('false',
                  style: TextStyle(
                    color: Colors.white,
                  ),),
                ),
              ),
            ),
          ),
          Row (children: scoreKeeper),
        ],
      )
    );
  }
}

