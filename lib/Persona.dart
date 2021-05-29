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

class Progress{
  int taskUnlocked=0;
  int rewards=0;
  int trophies=0;
  Progress({
    this.taskUnlocked=0,
    this.rewards=0,
    this.trophies=0
  });
}



List<Person> allPersonasLevel1 = [
  Person(
    firstName:"Naina",
    lastName: "Tiwari",
    age:23,
    description: "Student who enjoys playing with her dogs and loves the planet",
    profession: "BBA Final Year",
    futurePlans: "Good College in India or Abroad",
    likes:"Animals,Fashion,Shoes,Badam Milk",
    interests: "Earth,Stock Market,Baking and Cooking",
    routine:"Taking care of her dogs, Rottweiler ( Jimmy ) and Golden Retriever ( Pluto ),Cycling/Driving,Exercising,Cooking,Watching Tv,Study",
    dislikes: "Doing Dishes,Caffienated Drinks,Nuts,Surprises,Chopping Vegetables,Dresses",
    hobbies:"Cooking,Reading,Playing with dogs,Fiction Novels,Non Fiction",
    location:"Bangalore",
      chat: [
        Question(
          quesText: "What sport do you like to play the most?",
          ansText:
          "I like to play basketball",
          qFollowUp: [
            Question(
                quesText: "Which position do you play",
                ansText: 'Center',
                qFollowUp: [
                  Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
                ]
            ),
            Question(
              quesText: "Which player do you like?",
              ansText: 'Lebron James',
            ),
            Question(
                quesText: "How often do you watch it ",
                ansText: 'Regularly',
                qFollowUp: [
                  Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
                ]
            ),
          ],
        ),
        Question(
          quesText: "What do you like to do in your free time?",
          ansText:
          "I enjoy playing Basketball a lot",
          qFollowUp: [
            Question(
                quesText: "Which position do you play",
                ansText: 'Center',
                qFollowUp: [
                  Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
                ]
            ),
            Question(
              quesText: "Which player do you like?",
              ansText: 'Lebron James',
            ),
            Question(
                quesText: "How often do you watch it ",
                ansText: 'Regularly',
                qFollowUp: [
                  Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
                ]
            ),
          ],
        ),
        Question(
          quesText: "Do you like to play sports?",
          ansText:
          "Yes I do. I enjoy playing Basketball the most",
          qFollowUp: [
            Question(
                quesText: "Which position do you play",
                ansText: 'Center',
                qFollowUp: [
                  Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
                ]
            ),
            Question(
              quesText: "Which player do you like?",
              ansText: 'Lebron James',
            ),
            Question(
                quesText: "How often do you watch it ",
                ansText: 'Regularly',
                qFollowUp: [
                  Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
                ]
            ),
          ],
        ),
      ],
    gifts: [Gift(name:"Clothes", willLike: true),Gift(name:"Gift Hamper with Chocolate", willLike: true),Gift(name:"Surprise", willLike: false), Gift(name:"Sprite", willLike: false),Gift(name:"Dress", willLike: false),Gift(name:"Sweat Pants", willLike: true)],
      imageUrl: "assets/gifting/JessicaPearson.svg",
    likeChoices: [
      {"Lebron James": true, "Someone": false},
      {"Basketball": true, "Football": false},
    ],
    ideas:  {"CD PLayer":false, "Basketball":false, "Football":true, "Shoes":false, "Red Bull":false, "Charger":true, "Speaker":true, "Wallet":true, "Gym Membership":true}
  ),
  Person(
    firstName: "Jessica",
    lastName: "Pearson",
    description:
    "A lawyer in her mid 30s, loves to cook and watch sports during",
    profession: "Lawyer",
    age: 30,
    hobbies: 'Watching Tv, Dancing',
    dislikes: "Cats, Heels, Makeup",
    imageUrl: "assets/gifting/JessicaPearson.svg",
    likes: "Gym, Dog, Travel",
      chat: [
        Question(
          quesText: "What sport do you like to play the most?",
          ansText:
          "I like to play basketball",
          qFollowUp: [
            Question(
                quesText: "Which position do you play",
                ansText: 'Center',
                qFollowUp: [
                  Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
                ]
            ),
            Question(
              quesText: "Which player do you like?",
              ansText: 'Lebron James',
            ),
            Question(
                quesText: "How often do you watch it ",
                ansText: 'Regularly',
                qFollowUp: [
                  Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
                ]
            ),
          ],
        ),
        Question(
          quesText: "What do you like to do in your free time?",
          ansText:
          "I enjoy playing Basketball a lot",
          qFollowUp: [
            Question(
                quesText: "Which position do you play",
                ansText: 'Center',
                qFollowUp: [
                  Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
                ]
            ),
            Question(
              quesText: "Which player do you like?",
              ansText: 'Lebron James',
            ),
            Question(
                quesText: "How often do you watch it ",
                ansText: 'Regularly',
                qFollowUp: [
                  Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
                ]
            ),
          ],
        ),
        Question(
          quesText: "Do you like to play sports?",
          ansText:
          "Yes I do. I enjoy playing Basketball the most",
          qFollowUp: [
            Question(
                quesText: "Which position do you play",
                ansText: 'Center',
                qFollowUp: [
                  Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
                ]
            ),
            Question(
              quesText: "Which player do you like?",
              ansText: 'Lebron James',
            ),
            Question(
                quesText: "How often do you watch it ",
                ansText: 'Regularly',
                qFollowUp: [
                  Question(ansText: "Lebron James", quesText: "Do you have a favourite player?" )
                ]
            ),
          ],
        ),
      ], gifts: [],
    likeChoices: [
      {"Lebron James": true, "Someone Else": false},
      {"Basketball": true, "Football": false},
    ],
      ideas:  {"CD PLayer":false, "Basketball":false, "Football":true, "Shoes":false, "Red Bull":false, "Charger":true, "Speaker":true, "Wallet":true, "Gym Membership":true}
  ),
];

Person currentPersona;


Progress currentProgress = Progress(
    taskUnlocked:0,
    rewards:0,
    trophies:0
);

class MCQ {
  final String question;
  final List<String> answers;
  final int correctAnswer;

  MCQ(
      {@required this.question,
        @required this.answers,
        @required this.correctAnswer});
}


final mtfList = [
  {"Empathise":"Understanding the user","Define":"Tangible form of ideas","Ideate":"Concept Generalisation","Prototype":"Simulation","Testing":"Checking"}
];


final mcqList = [
  MCQ(
    question: "What are the steps of Design Thinking Process?",
    answers: [
      "Understand > Draw > Ideate > Create > Test",
      "Empathise > Define > Ideate > Prototype > Test",
      "Empathise > Design > Implement > Produce > Test",
      "Understand > Define > Ideate > Produce > Try"
    ],
    correctAnswer: 1,
  ),
  MCQ(
    question: "What are the three elements of Innovation?",
    answers: [
      "Desirability, Feasibility, Viability",
      "Originality, Profitability, Technicality",
      "Originality, Feasibility, Technicality",
      "Desirability, Profitability, Viability"
    ],
    correctAnswer: 0,
  ),
  MCQ(
    question:
    "Which one of the following does NOT resonate with the Empathy Stage?",
    answers: [
      "Personal interviews with users",
      "Seek to understand users",
      "Shadowing the users",
      "Mock-up of the solution"
    ],
    correctAnswer: 3,
  ),
  MCQ(
    question: "Which of the below is incorrect? [DT = Design Thinking]",
    answers: [
      "PepsiCo has turned DT into its strategy",
      "GE Healthcare built a MR scanner for children using DT",
      "AirBnB turned profitable avoiding bankruptcy using DT",
      "All of the options are correct"
    ],
    correctAnswer: 3,
  ),
];



