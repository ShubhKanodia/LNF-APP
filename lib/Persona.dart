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
      likes:"Comfortable Fashion, Baking",
      interests: "Novels, Baking, Cooking",
      routine:"Taking care of her dogs, Rottweiler ( Jimmy ) and Golden Retriever ( Pluto ),Cycling/Driving,Exercising,Cooking,Watching Tv,Study",
      dislikes: "Chopping Vegetables,Dresses",
      hobbies:"Cooking,Reading,Novels",
      location:"Bangalore",
      chat: [
        Question(
          quesText: "What do you do all day?",
          ansText:
          "I cook, exercise, study and watch at least one movie on a daily basis.",
          qFollowUp: [
            Question(
                quesText: "Oh! Do you enjoy cooking?",
                ansText: " I enjoy baking a lot but cooking can be very tiring. ",
                qFollowUp: [
                  Question(ansText: "Not very often. I don’t have a lot of equipment needed to bake. I really should go buy some.", quesText: "How often do you bake?" ),
                  Question(ansText: "There’s a lot of preparation needed. I hate chopping vegetables. I should really consider getting a food processor.", quesText: "What about cooking makes it tiring?" )
                ]
            )
          ],
        ),
        Question(
          quesText: "What do you like to do in your free time?",
          ansText:
          "I enjoy baking and reading!",
          qFollowUp: [
            Question(
                quesText: "What kind of novels do you read?",
                ansText: " I’m a hopeless romantic. I can’t wait for Savi Sharma’s next novel!")
          ],
        ),
      ],
      gifts: [Gift(name:"Clothes", willLike: true), Gift(name:"Sprite", willLike: false),Gift(name:"Dress", willLike: false),Gift(name:"Sweat Pants", willLike: true)],
      imageUrl: "assets/gifting/JessicaPearson.svg",
      likeChoices: [
        {"Sweatpants": true, "Pencil Skirt": false},
        {"Muffins": false, "Chocolate chips": true},
      ],
      ideas:  {"Knife":false, "Food Processor":true, "Sweater":true, "Pen":false, "Heels":false, "Book":true, "Baking mould":true, "Crystals":false,"Dishwasher":true},
      taskMax:{1:4,2:2,3:5,4:10}
  ),
  Person(
      firstName:"Rohit",
      lastName: "Ravishankar",
      age:20,
      description: "Student who loves games and anime",
      profession: "CSE Second Year",
      futurePlans: "Join a game development company",
      likes:"Gaming, Astronomy, anime",
      interests: "Tech Development, Bikes, Volleyball",
      routine:"Wakes up in the afternoon, documentary, study, anime, volleyball, video games ",
      dislikes: "Old shoes, Xbox",
      hobbies:"Gaming, anime, volleyball",
      location:"Pune",
      chat: [
        Question(
          quesText: "What are your interests?",
          ansText:
          "I love virtual gaming!",
          qFollowUp: [
            Question(
                quesText: "What would create your best experience for it?",
                ansText: "I think a PS4 would be the best way to experience gaming."
            ),
            Question(
              quesText: "What kind of games do you play?",
              ansText: "I play both volleyball and I enjoy gaming on my PC too!",
              qFollowUp: [
                  Question(ansText: "Actually, I only play virtual games now, ever since I wore out my old volleyball shoes!", quesText: "What do you think is missing from the picture?" )
                ]
            ),
            Question(
                quesText: "How do you enjoy it?",
                ansText: "I play games on my PC, but I wish I could have a better experience.",
                qFollowUp: [
                  Question(
                    quesText: "What do you think is missing from the picture?",
                    ansText: "My PC doesn’t have good graphics like a PlayStation does!",
                    qFollowUp: [
                        Question(
                        quesText: " What would create your best experience for it?",
                        ansText: "Anything with better graphics than my present PC would make me happy, man!")
                    ])
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
                quesText: "What would create your best experience for it?",
                ansText: "I think a PS4 would be the best way to experience gaming."
            ),
            Question(
                quesText: "What kind of games do you play?",
                ansText: "I play both volleyball and I enjoy gaming on my PC too!",
                qFollowUp: [
                  Question(ansText: "Actually, I only play virtual games now, ever since I wore out my old volleyball shoes!", quesText: "What do you think is missing from the picture?" )
                ]
            ),
            Question(
                quesText: "How do you enjoy it?",
                ansText: "I play games on my PC, but I wish I could have a better experience.",
                qFollowUp: [
                  Question(
                      quesText: "What do you think is missing from the picture?",
                      ansText: "My PC doesn’t have good graphics like a PlayStation does!",
                      qFollowUp: [
                        Question(
                            quesText: " What would create your best experience for it?",
                            ansText: "Anything with better graphics than my present PC would make me happy, man!")
                      ])
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
                quesText: "What would create your best experience for it?",
                ansText: "I think a PS4 would be the best way to experience gaming."
            ),
            Question(
                quesText: "What kind of games do you play?",
                ansText: "I play both volleyball and I enjoy gaming on my PC too!",
                qFollowUp: [
                  Question(ansText: "Actually, I only play virtual games now, ever since I wore out my old volleyball shoes!", quesText: "What do you think is missing from the picture?" )
                ]
            ),
            Question(
                quesText: "How do you enjoy it?",
                ansText: "I play games on my PC, but I wish I could have a better experience.",
                qFollowUp: [
                  Question(
                      quesText: "What do you think is missing from the picture?",
                      ansText: "My PC doesn’t have good graphics like a PlayStation does!",
                      qFollowUp: [
                        Question(
                            quesText: " What would create your best experience for it?",
                            ansText: "Anything with better graphics than my present PC would make me happy, man!")
                      ])
                ]
            ),
          ],
        ),
      ],
      gifts: [Gift(name:"PS4", willLike: true),Gift(name:"Volleyball Shoes", willLike: true),Gift(name:"Kurta", willLike: false), Gift(name:"Romeo and Juliet Book", willLike: false),Gift(name:"Sour Candy", willLike: false),Gift(name:"anime Merch", willLike: true),Gift(name:"Telescope", willLike: true),Gift(name:"Laptop with good graphics", willLike: true)],
      imageUrl: "assets/gifting/HarveySpectre.svg",
      likeChoices: [
        {"Xbox": false, "PS4": true},
        {"Basketball": false, "Volleyball": true},
      ],
      ideas:  {"Xbox":false, "PS4":true, "Volleyball Shoes":true, "Books":false, "Telescope":true, "Binder":false, "Laptop":true, "Kurta":false},
  taskMax:{1:4,2:2,3:4,4:10}
      ),
  Person(
      firstName:"Riya",
      lastName: "Sharma",
      age:17,
      description: "Student who enjoys playing with her dogs and loves the planet",
      profession: "12th Grade",
      futurePlans: "Influencer (Architect if it doesn't work out)",
      likes:"Skin care, Stationary, Bollywood",
      interests: "Fashion,Influencers",
      routine:"Early morning bath, skin care,redo nail polish alternate days, attend classes and make notes, youtube, running, bullet journaling",
      dislikes: "Cooking,Gifted clothes",
      hobbies:"Vlogging,Romance Novels",
      location:"Bangalore",
      chat: [
        Question(
          quesText: "What is your ambition?",
          ansText:
          "I’m planning on becoming an architect.",
          qFollowUp: [
            Question(
                quesText: "Do you have everything ready to become to pursue your dream?",
                ansText: "I just need to buy a few stationary and art supplies."
            ),
            Question(
                quesText: "Do you think anything can give you more perspective about your dream?",
                ansText: "Everyone is recommending me to watch ‘The World's Most Extraordinary Homes’ on Netflix!",
                qFollowUp: [
                  Question(ansText: "Actually, I don’t even have a netflix subscription!", quesText: "Do you have everything ready to go down that road?" )
                ]
            ),
            Question(
                quesText: "Do you have anything particular in mind?",
                ansText: " I’m confused between becoming a social media influencer and an architect.",
                qFollowUp: [
                  Question(
                      quesText: "Does anything particularly drive you towards it?",
                      ansText: "I think architecture is the stable option, but I’m more worried on the influencer aspect of my dream!",
                      qFollowUp: [
                        Question(
                            quesText: " Do you have everything ready to pursue your dream? ",
                            ansText: "Haha, I actually just have to start, probably have to start taking care of my skin to look glamorous! ")
                      ])
                ]
            ),
          ],
        ),
        Question(
          quesText: "What course are you planning to pursue?",
          ansText:
          "I’m going to pursue architecture.",
          qFollowUp: [
            Question(
                quesText: "Do you have everything ready to become to pursue your dream?",
                ansText: "I just need to buy a few stationary and art supplies."
            ),
            Question(
                quesText: "Do you think anything can give you more perspective about your dream?",
                ansText: "Everyone is recommending me to watch ‘The World's Most Extraordinary Homes’ on Netflix!",
                qFollowUp: [
                  Question(ansText: "Actually, I don’t even have a netflix subscription!", quesText: "Do you have everything ready to go down that road?" )
                ]
            ),
            Question(
                quesText: "Do you have anything particular in mind?",
                ansText: " I’m confused between becoming a social media influencer and an architect.",
                qFollowUp: [
                  Question(
                      quesText: "Does anything particularly drive you towards it?",
                      ansText: "I think architecture is the stable option, but I’m more worried on the influencer aspect of my dream!",
                      qFollowUp: [
                        Question(
                            quesText: " Do you have everything ready to pursue your dream? ",
                            ansText: "Haha, I actually just have to start, probably have to start taking care of my skin to look glamorous! ")
                      ])
                ]
            ),
          ],
        ),
        Question(
          quesText: "What do you think the future holds for you?",
          ansText:
          "I’m very creative, so I’m planning to pursue something in that field.",
          qFollowUp: [
            Question(
                quesText: "Do you have everything ready to become to pursue your dream?",
                ansText: "I just need to buy a few stationary and art supplies."
            ),
            Question(
                quesText: "Do you think anything can give you more perspective about your dream?",
                ansText: "Everyone is recommending me to watch ‘The World's Most Extraordinary Homes’ on Netflix!",
                qFollowUp: [
                  Question(ansText: "Actually, I don’t even have a netflix subscription!", quesText: "Do you have everything ready to go down that road?" )
                ]
            ),
            Question(
                quesText: "Do you have anything particular in mind?",
                ansText: " I’m confused between becoming a social media influencer and an architect.",
                qFollowUp: [
                  Question(
                      quesText: "Does anything particularly drive you towards it?",
                      ansText: "I think architecture is the stable option, but I’m more worried on the influencer aspect of my dream!",
                      qFollowUp: [
                        Question(
                            quesText: " Do you have everything ready to pursue your dream? ",
                            ansText: "Haha, I actually just have to start, probably have to start taking care of my skin to look glamorous! ")
                      ])
                ]
            ),
          ],
        ),
      ],
      gifts: [Gift(name:"Stationary Hamper", willLike: true),Gift(name:"Skin care products", willLike: true),Gift(name:"Netflix/Youtube Premium Subscription", willLike: true), Gift(name:"Lipstick", willLike: false),Gift(name:"Dress", willLike: false),Gift(name:"Silicone cupcake moulds", willLike: false),Gift(name:"Romance Novels by Ravinder Singh", willLike: true),Gift(name:"Heels", willLike: true),Gift(name:"Nail Paint and Nail Art", willLike: true),Gift(name:"Crystals", willLike: true)],
      imageUrl: "assets/gifting/rachelZane.svg",
      likeChoices: [
        {"Book": false, "Baking moulds": true},
        {"Lotion": true, "Dress": false},
      ],
      ideas:  {"Stationary":true, "Basketball":false, "Book":true, "Skirt":false, "Lotion":true, "Charger":false, "Netflix":true, "Xbox":false},
      taskMax:{1:4,2:2,3:4,4:10}
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
  int quiz =0;

  Evaluation({this.task, this.quiz});
}

Evaluation l1Score = Evaluation();

QuizProgress currentQuizProgress = QuizProgress();


final totalQuizPossibleScore = 2;
///When you update catchTheNutMap, you also need to increase the above to the max possible score
final catchTheNutMap =
  {"What are the steps of Design Thinking Process?":{"Define":true,"Prototype":true,"Draw":false, "Empathise":true, "Try":false, "Ideate":true,"Test":true,"Produce":false},
  "What are the elements of Innovation?":{"Originality":false,"Viability":true,"Feasibility":true,"Technicality":false,"Profitability":false,"Desirability":true},
  "Which ones resonate with the Empathy Stage?":{"Interviews":true,"Understand user":true,"Solution Mock-up":false, "User Shadowing":true},
  "Which are correct?":{"PepsiCo has turned Design Thinking into its strategy":true,"GE Healthcare has built a MR scanner for children using Design Thinking":true,"AirBnB avoided bankruptcy and turned profitable using Design Thinking":true,"Google has a 3 step process to bring about new innovations":true}};



