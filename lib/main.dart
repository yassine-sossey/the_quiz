import 'package:flutter/material.dart';
import 'meta_data_question_bank.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

MetaDataQuestions metadata = MetaDataQuestions();

//LIst to keep score icons (good or bad)
List<Icon> scoreKeeper = [];

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                metadata.getquestions(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: const ButtonStyle(
                foregroundColor: MaterialStatePropertyAll(Colors.white),
                backgroundColor: MaterialStatePropertyAll(Colors.green),
              ),
              child: const Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  metadata.getNextQuestion(scoreKeeper, true);
                  if (metadata.getState() == true) {
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "congrats you finished ",
                      desc:
                          "your good answers : ${scoreKeeper.where((element) => element == metadata.good).length} \nyou like to replay ? ",
                      buttons: [
                        DialogButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              scoreKeeper = [];
                              metadata = MetaDataQuestions();
                            });
                          },
                          width: 120,
                          child: const Text(
                            "replay",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ).show();
                  }
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                setState(() {
                  metadata.getNextQuestion(scoreKeeper, false);
                  if (metadata.getState() == true) {
                    Alert(
                      context: context,
                      type: AlertType.success,
                      title: "congrats you finished ",
                      desc:
                          "your good answers : ${scoreKeeper.where((element) => element == metadata.good).length} \nyou like to replay ? ",
                      buttons: [
                        DialogButton(
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              scoreKeeper = [];
                              metadata = MetaDataQuestions();
                            });
                          },
                          width: 120,
                          child: const Text(
                            "replay",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        )
                      ],
                    ).show();
                  }
                });
              },
            ),
          ),
        ),
        //score keeper after each answer
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
