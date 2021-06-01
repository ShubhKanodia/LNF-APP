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
      ideas:  {"CD PLayer":false, "Basketball":false, "Football":true, "Shoes":false, "Red Bull":false, "Charger":true, "Speaker":true, "Wallet":true, "Gym Membership":true},
      taskMax:{1:4,2:2,3:5,4:10}
  ),
  Person(
      firstName:"Rohit",
      lastName: "Ravishankar",
      age:20,
      description: "Student who loves games and anime",
      profession: "CSE Second Year",
      futurePlans: "Join a game development company",
      likes:"Gaming (COD, CS Go), PS4, Fashion(over-sized shirts/pjs), Japanese anime",
      interests: "Astronomy, Tech Development, Bikes, Volleyball",
      routine:"Wakes up in the afternoon, documentary, study, anime, volleyball, video games ",
      dislikes: "Bollywood, Sour things, Capitalism, Sleeping early, Romance, Indian clothes",
      hobbies:"Gaming, anime, volleyball, dog parks, Singing, Star gazing",
      location:"Pune",
      chat: [
        Question(
          quesText: "What are your interests?",
          ansText:
          "I love virtual gaming!",
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
          "I enjoy gaming a lot.",
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
          quesText: "Do you like to do anything in particular when you’re bored?",
          ansText:
          "Yes, I enjoy gaming!",
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
      gifts: [Gift(name:"PS4", willLike: true),Gift(name:"Volleyball Shoes", willLike: true),Gift(name:"Kurta", willLike: false), Gift(name:"Romeo and Juliet Book", willLike: false),Gift(name:"Sour Candy", willLike: false),Gift(name:"Japanese anime Merch", willLike: true),Gift(name:"Telescope", willLike: true),Gift(name:"Laptop with good graphics", willLike: true)],
      imageUrl: "assets/gifting/JessicaPearson.svg",
      likeChoices: [
        {"Lebron James": true, "Someone": false},
        {"Basketball": true, "Football": false},
      ],
      ideas:  {"CD PLayer":false, "Basketball":false, "Football":true, "Shoes":false, "Red Bull":false, "Charger":true, "Speaker":true, "Wallet":true, "Gym Membership":true},
  taskMax:{1:4,2:2,3:5,4:10}
      ),
  Person(
      firstName:"Riya",
      lastName: "Sharma",
      age:17,
      description: "Student who enjoys playing with her dogs and loves the planet",
      profession: "12th Grade",
      futurePlans: "Influencer (Architect if it doesn't work out)",
      likes:"Clothes, Make up, Small businesses, Mexican food, Fashion, Architecture, Stationary, Bollywood, Netflix, Karthik Aryan ",
      interests: "Fashion Blogging, Youtubing, Crystal manifestation and Astrology, Thrifting, Social Media Influencers, Handmade Items",
      routine:"Early morning bath, skin care,redo nail polish alternate days, attend classes and make notes, youtube, running, bullet journaling",
      dislikes: "Cooking, Being told Influencer isn't a career option, Green, Advertisements on youtube, Gifted clothes, not having her own netflix account, Lipstick, being short",
      hobbies:"Making videos, Singing, Dancing, Reading love stories by Indian authors, Stalking celebrities(Karthik Aryan),Bingewatching Rom-coms",
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
      gifts: [Gift(name:"Stationary Hamper", willLike: true),Gift(name:"Skin care products", willLike: true),Gift(name:"Netflix/Youtube Premium Subscription", willLike: true), Gift(name:"Lipstick", willLike: false),Gift(name:"Dress", willLike: false),Gift(name:"Silicone cupcake moulds", willLike: false),Gift(name:"Romance Novels by Ravinder Singh", willLike: true),Gift(name:"Heels", willLike: true),Gift(name:"Nail Paint and Nail Art", willLike: true),Gift(name:"Crystals", willLike: true)],
      imageUrl: "assets/gifting/JessicaPearson.svg",
      likeChoices: [
        {"Lebron James": true, "Someone": false},
        {"Basketball": true, "Football": false},
      ],
      ideas:  {"CD PLayer":false, "Basketball":false, "Football":true, "Shoes":false, "Red Bull":false, "Charger":true, "Speaker":true, "Wallet":true, "Gym Membership":true},
      taskMax:{1:4,2:2,3:5,4:10}
  ),
];

Person currentPersona;


Progress currentProgress = Progress(
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
  int quiz;

  Evaluation({this.task, this.quiz});
}

Evaluation l1Score = Evaluation();

QuizProgress currentQuizProgress = QuizProgress();


final totalQuizPossibleScore = 2;
final catchTheNutMap =
  {"What are the steps of Design Thinking Process?":{"Define":true,"Prototype":true,"Draw":false}};



