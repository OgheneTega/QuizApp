import 'package:flutter/material.dart';
import 'package:quizzler/questions.dart';
import 'package:quizzler/quiz_brain.dart';
// import 'quiz_brain.dart';

// QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //takes out that annoying banner on the top right corner
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  // List<String> questions = [
  //   'You can lead a cow down stairs but not up stairs.',
  //   'Approximately one quarter of human bones are in the feet.',
  //   'A slug\'s blood is green.'
  // ];

  // List<bool> answers = [false, true, true];
  // List<Question> questionBank = [
  //   Question('You can lead a cow down stairs but not up stairs.', false),
  //   Question('Approximately one quarter of human bones are in the feet.', true),
  //   Question('A slug\'s blood is green.', true)
  // ];

  QuizBrain quizBrain =
      QuizBrain(); // creating an instance of QuizBrain class so you don't need those lists up
  //as you are able to access the QuizBrain class directly

  int questionNumber = 0;
  Question questionSrc; //a variable of Question class which we'll use below

  @override
  Widget build(BuildContext context) {
    questionSrc = quizBrain.questionBank[
        questionNumber]; //helping to make your code shorter by passing this long ass fn to a variable
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: new Text(
                questionSrc.questions,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green)),
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool correctAnswer = questionSrc.answers;
                // questionSrc.answers;
                if (correctAnswer == true) {
                  print('user got it right');
                } else {
                  print('user got it wrong');
                }
                setState(() {
                  questionNumber++;
                });
                //The user picked true.
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red)),
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool correctAnswer = questionSrc.answers;
                // questionSrc.answers;
                if (correctAnswer == false) {
                  print('user got it right');
                } else {
                  print('user got it wrong');
                }
                setState(() {
                  questionNumber++;
                });
                //The user picked false.
              },
            ),
          ),
        ),
        Row(children: scoreKeeper)
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
