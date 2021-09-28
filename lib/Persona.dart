import 'package:flutter/material.dart';
class Person{
int age;
String profession;
String futurePlans;
String likes;
String interests;
String routine;
String dislikes;
String hobbies;
String location;
List<Gift> gifts;
List<Question> chat;
String imageUrl;
String firstName;
String lastName;
String description;
List<Map<String, bool>> likeChoices;
Map<String, bool> ideas; ///Make sure you keep first one as empty
  Map<int, int> taskMax;

Person({
  @required this.firstName,
@required this.lastName,
@required this.imageUrl,
@required this.description,
@required this.age,
  this.profession,
  this.futurePlans,
  this.likes,
  this.interests,
  this.routine,
  this.dislikes,
  this.hobbies,
  this.location,
  this.ideas,
  @required this.likeChoices,
  @required this.gifts,
@required this.chat,
  @required this.taskMax
});
}

class Question {
  final String quesText;
  final String ansText;
  final List<Question> qFollowUp;

  Question({
    @required this.quesText,
    @required this.ansText,
    this.qFollowUp,
  });
}

class Gift{
String name;
bool willLike;
Gift({@required this.name, this.willLike});
}


///Task Levels
///1 - 7 : Level 1

class Progress{
  int taskUnlocked=0;
  bool playingLevel2=false;
  int rewards=0;
  int trophies=0;
  Progress({
    this.playingLevel2=false,
    this.taskUnlocked=0,
    this.rewards=0,
    this.trophies=0
  });
}

Person currentPersonaL1;
Person currentPersonaL2;
Progress currentProgress = Progress(
    playingLevel2: false,
    taskUnlocked:0,
    rewards:0,
    trophies:0
);

class QuizProgress{
  int currentQuestionNumber=0;
  int score=0;

  QuizProgress({this.currentQuestionNumber, this.score});

  void reset(){
    this.currentQuestionNumber=0;
    this.score=0;
  }
}

class Evaluation{
  Map<int,int> task = {};
  int quiz =0;

  Evaluation({this.task, this.quiz});
}

Evaluation l1Score = Evaluation();
Evaluation l2Score = Evaluation();

QuizProgress currentQuizProgress = QuizProgress();



