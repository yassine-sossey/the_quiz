import 'package:the_quiz/question.dart';
import 'package:flutter/material.dart';

// source of all questions and answers protected with only 3 getters
class MetaDataQuestions {
  int _questionNumber = 0;
  final List<Question> _metaDataQuestions = [
    Question('You can lead a cow down stairs but not up stairs.', false),
    Question('Approximately one quarter of human bones are in the feet.', true),
    Question("A slug's blood is green.", true),
    Question('The Great Wall of China is visible from space.', false),
    Question('The capital of Australia is Sydney.', false),
    Question('Waterloo is in Belgium.', true),
    Question('The human body has four lungs.', false),
    Question('Goldfish only have a memory span of three seconds.', false),
    Question('Mount Kilimanjaro is the tallest mountain in the world.', false),
    Question('Bananas grow on trees.', false),
    Question('Venus is the closest planet to the Sun.', false),
    Question('The currency of Japan is the yuan.', false),
    Question('Leonardo da Vinci painted the Mona Lisa.', true),
    Question('The Amazon River is the longest river in the world.', true),
    //Question('Diamonds are made of carbon.', true),
  ];
  // good icon when answer is correct
  Icon good = const Icon(
    Icons.check,
    color: Colors.green,
  );
// bad icon when answer is wrong
  Icon bad = const Icon(
    Icons.close,
    color: Colors.red,
  );
  void getNextQuestion(List scoreKeeper, bool b) {
    if (_questionNumber < _metaDataQuestions.length - 1) {
      getanswers() == b ? scoreKeeper.add(good) : scoreKeeper.add(bad);
      _questionNumber++;
    }
  }

  String getquestions() => _metaDataQuestions[_questionNumber].question;
  bool getanswers() => _metaDataQuestions[_questionNumber].answer;
  bool getState() =>
      _questionNumber == _metaDataQuestions.length - 1 ? true : false;
}
