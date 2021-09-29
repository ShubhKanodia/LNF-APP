import 'package:learnnfun/tasks/2_define_bb.dart';
import 'package:learnnfun/tasks/3_ideate.dart';
import 'package:learnnfun/tasks/4_prototype.dart';
import 'package:learnnfun/tasks/5_test.dart';

import 'Persona.dart';
import 'tasks/1_chat_empathize.dart';

List<Person> level1Persona = [
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
      taskMax:{1:3,2:2,3:5,4:10}
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

List<Person> level2Persona = [
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
          quesText: "Hey, how are you feeling today?",
          ansText:
          " I’m feeling good, but I’m a little sleepy though! ",
          qFollowUp: [
            Question(
                quesText: " Is there any particular reason for it?",
                ansText: "Yea, I love gaming, so I just lose track of time at night when I’m in front of my PC!",
                qFollowUp: [
                  Question(ansText: " Yes! I even want to become a professional game developer in the future!", quesText: "Wow, do you want to take it up as a career option?",
                      qFollowUp: [
                      Question(ansText: "  I think a PS4 would be the best way to experience gaming and learn from it.", quesText: " What would help you in your path?")])
                ]
            ),
            Question(
                quesText: " Why do you feel that way?",
                ansText: "I sleep quite late most nights, and my dad woke me up early!",
                qFollowUp: [
                  Question(ansText: " I slept late last night because I was gaming and had to wake up early for volleyball practice!", quesText: "Wow, how did that happen?",
                      qFollowUp: [
                        Question(ansText: " I play both volleyball and I enjoy gaming on my PC too!", quesText: "Wow, so what kind of games do you play? ",
                            qFollowUp: [
                              Question(ansText: "Actually, I only play virtual games now, ever since I wore out my old volleyball shoes!", quesText: " What do you think is missing from the picture?")])
                      ])]),
            Question(
                quesText: " Everyone does! Is it just today, or do you feel this way all days?",
                ansText: " I had to wake up early today, but I sleep late almost always!",
                qFollowUp: [
                  Question(ansText: "I sleep late because I play games until late at night!", quesText: "Why are you so proud of it?",
                      qFollowUp: [
                        Question(ansText: "  I absolutely love playing games on my PC, but I wish I could have a better experience. ", quesText: "Do you enjoy playing games? ",
                            qFollowUp: [
                              Question(ansText: "My PC doesn’t have good graphics like a PlayStation does!", quesText: " Why do you feel that way about your experience?",
                                  qFollowUp: [
                                    Question(ansText: "Anything with better graphics than my present PC would make me happy, man!", quesText: " What would create your best experience for it?")])])
                      ])])
      ]
            ),
        Question(
          quesText: "Hey, are you okay?",
          ansText:
          "I’m fine, it’s just that I’m feeling quite drowsy!",
            qFollowUp: [
              Question(
                  quesText: " Is there any particular reason for it?",
                  ansText: "Yea, I love gaming, so I just lose track of time at night when I’m in front of my PC!",
                  qFollowUp: [
                    Question(ansText: " Yes! I even want to become a professional game developer in the future!", quesText: "Wow, do you want to take it up as a career option?",
                        qFollowUp: [
                          Question(ansText: "  I think a PS4 would be the best way to experience gaming and learn from it.", quesText: " What would help you in your path?")])
                  ]
              ),
              Question(
                  quesText: " Why do you feel that way?",
                  ansText: "I sleep quite late most nights, and my dad woke me up early!",
                  qFollowUp: [
                    Question(ansText: " I slept late last night because I was gaming and had to wake up early for volleyball practice!", quesText: "Wow, how did that happen?",
                        qFollowUp: [
                          Question(ansText: " I play both volleyball and I enjoy gaming on my PC too!", quesText: "Wow, so what kind of games do you play? ",
                              qFollowUp: [
                                Question(ansText: "Actually, I only play virtual games now, ever since I wore out my old volleyball shoes!", quesText: " What do you think is missing from the picture?")])
                        ])]),
              Question(
                  quesText: " Everyone does! Is it just today, or do you feel this way all days?",
                  ansText: " I had to wake up early today, but I sleep late almost always!",
                  qFollowUp: [
                    Question(ansText: "I sleep late because I play games until late at night!", quesText: "Why are you so proud of it?",
                        qFollowUp: [
                          Question(ansText: "  I absolutely love playing games on my PC, but I wish I could have a better experience. ", quesText: "Do you enjoy playing games? ",
                              qFollowUp: [
                                Question(ansText: "My PC doesn’t have good graphics like a PlayStation does!", quesText: " Why do you feel that way about your experience?",
                                    qFollowUp: [
                                      Question(ansText: "Anything with better graphics than my present PC would make me happy, man!", quesText: " What would create your best experience for it?")])])
                        ])])
            ]
        ),
        Question(
          quesText: "Hey, what’s up?",
          ansText:
          "Nothing much, I just feel like sleeping! ",
            qFollowUp: [
              Question(
                  quesText: " Is there any particular reason for it?",
                  ansText: "Yea, I love gaming, so I just lose track of time at night when I’m in front of my PC!",
                  qFollowUp: [
                    Question(ansText: " Yes! I even want to become a professional game developer in the future!", quesText: "Wow, do you want to take it up as a career option?",
                        qFollowUp: [
                          Question(ansText: "  I think a PS4 would be the best way to experience gaming and learn from it.", quesText: " What would help you in your path?")])
                  ]
              ),
              Question(
                  quesText: " Why do you feel that way?",
                  ansText: "I sleep quite late most nights, and my dad woke me up early!",
                  qFollowUp: [
                    Question(ansText: " I slept late last night because I was gaming and had to wake up early for volleyball practice!", quesText: "Wow, how did that happen?",
                        qFollowUp: [
                          Question(ansText: " I play both volleyball and I enjoy gaming on my PC too!", quesText: "Wow, so what kind of games do you play? ",
                              qFollowUp: [
                                Question(ansText: "Actually, I only play virtual games now, ever since I wore out my old volleyball shoes!", quesText: " What do you think is missing from the picture?")])
                        ])]),
              Question(
                  quesText: " Everyone does! Is it just today, or do you feel this way all days?",
                  ansText: " I had to wake up early today, but I sleep late almost always!",
                  qFollowUp: [
                    Question(ansText: "I sleep late because I play games until late at night!", quesText: "Why are you so proud of it?",
                        qFollowUp: [
                          Question(ansText: "  I absolutely love playing games on my PC, but I wish I could have a better experience. ", quesText: "Do you enjoy playing games? ",
                              qFollowUp: [
                                Question(ansText: "My PC doesn’t have good graphics like a PlayStation does!", quesText: " Why do you feel that way about your experience?",
                                    qFollowUp: [
                                      Question(ansText: "Anything with better graphics than my present PC would make me happy, man!", quesText: " What would create your best experience for it?")])])
                        ])])
            ]
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
            quesText: "What do you think the future holds for you? ",
            ansText:
            "I’m very creative, so I’m planning to pursue something in that field. ",
            qFollowUp: [
              Question(
                  quesText: " Do you have anything particular in mind?",
                  ansText: "I’m confused between becoming a social media influencer and an architect.",
                  qFollowUp: [
                    Question(ansText: "I think architecture is the stable option, so I would probably move forward in that path.", quesText: "Does anything particularly drive you towards it?",
                        qFollowUp: [
                          Question(ansText: "  I just need to buy a few stationary and art supplies, and I can get started! ", quesText: " Do you have everything ready to pursue your dream? ")])
                  ]
              ),
              Question(
                  quesText: "  The creative field is quite vast, have you narrowed it down?",
                  ansText: " I do want to become a social media influencer, but I’m more inclined towards architecture.",
                  qFollowUp: [
                    Question(ansText: "I’m going to take a Bachelor's degree in Architecture.", quesText: "Wow, how did that happen?",
                        qFollowUp: [
                          Question(ansText: " Everyone is recommending me to watch ‘The World's Most Extraordinary Homes’ on Netflix!", quesText: "Do you think anything can give you more perspective about your dream?  ",
                              qFollowUp: [
                                Question(ansText: "Actually, I don’t even have a Netflix subscription!", quesText: " Do you have everything ready to go down that road? ")])
                        ])]),
              Question(
                  quesText: "  Have you thought about what you want to do in the creative field?",
                  ansText: "  I’m confused between becoming a social media influencer and an architect.",
                  qFollowUp: [
                    Question(ansText: "I’ve always dreamed of being an influencer, but somehow I feel like I’m going to end up picking architecture.", quesText: "Do you think you have a closer affinity to one of them?",
                        qFollowUp: [
                          Question(ansText: " Well, I do think architecture is the stable option, but I’m more worried on the influencer aspect of my dream!", quesText: "Does anything particularly drive you towards it? ",
                              qFollowUp: [
                                Question(ansText: "I’m very passionate about it, but it’s not a stable path, and I have a long way to go!", quesText: " What’s worrying you about the influencer option? ",
                                    qFollowUp: [
                                      Question(ansText: "Haha, I actually just have to start, probably have to start taking care of my skin to look glamorous!", quesText: "  Do you have everything ready to pursue your dream? ")])])
                        ])])
            ]
        ),
        Question(
            quesText: "Do you have any plans for the future?",
            ansText:
            " I’m quite creative, so I want to tread that path.",
            qFollowUp: [
              Question(
                  quesText: " Do you have anything particular in mind?",
                  ansText: "I’m confused between becoming a social media influencer and an architect.",
                  qFollowUp: [
                    Question(ansText: "I think architecture is the stable option, so I would probably move forward in that path.", quesText: "Does anything particularly drive you towards it?",
                        qFollowUp: [
                          Question(ansText: "  I just need to buy a few stationary and art supplies, and I can get started! ", quesText: " Do you have everything ready to pursue your dream? ")])
                  ]
              ),
              Question(
                  quesText: "  The creative field is quite vast, have you narrowed it down?",
                  ansText: " I do want to become a social media influencer, but I’m more inclined towards architecture.",
                  qFollowUp: [
                    Question(ansText: "I’m going to take a Bachelor's degree in Architecture.", quesText: "Wow, how did that happen?",
                        qFollowUp: [
                          Question(ansText: " Everyone is recommending me to watch ‘The World's Most Extraordinary Homes’ on Netflix!", quesText: "Do you think anything can give you more perspective about your dream?  ",
                              qFollowUp: [
                                Question(ansText: "Actually, I don’t even have a Netflix subscription!", quesText: " Do you have everything ready to go down that road? ")])
                        ])]),
              Question(
                  quesText: "  Have you thought about what you want to do in the creative field?",
                  ansText: "  I’m confused between becoming a social media influencer and an architect.",
                  qFollowUp: [
                    Question(ansText: "I’ve always dreamed of being an influencer, but somehow I feel like I’m going to end up picking architecture.", quesText: "Do you think you have a closer affinity to one of them?",
                        qFollowUp: [
                          Question(ansText: " Well, I do think architecture is the stable option, but I’m more worried on the influencer aspect of my dream!", quesText: "Does anything particularly drive you towards it? ",
                              qFollowUp: [
                                Question(ansText: "I’m very passionate about it, but it’s not a stable path, and I have a long way to go!", quesText: " What’s worrying you about the influencer option? ",
                                    qFollowUp: [
                                      Question(ansText: "Haha, I actually just have to start, probably have to start taking care of my skin to look glamorous!", quesText: "  Do you have everything ready to pursue your dream? ")])])
                        ])])
            ]
        ),
        Question(
            quesText: "What do you think the future holds for you?",
            ansText:
            "I feel like my future lies in the creative field. ",
            qFollowUp: [
              Question(
                  quesText: " Do you have anything particular in mind?",
                  ansText: "I’m confused between becoming a social media influencer and an architect.",
                  qFollowUp: [
                    Question(ansText: "I think architecture is the stable option, so I would probably move forward in that path.", quesText: "Does anything particularly drive you towards it?",
                        qFollowUp: [
                          Question(ansText: "  I just need to buy a few stationary and art supplies, and I can get started! ", quesText: " Do you have everything ready to pursue your dream? ")])
                  ]
              ),
              Question(
                  quesText: "  The creative field is quite vast, have you narrowed it down?",
                  ansText: " I do want to become a social media influencer, but I’m more inclined towards architecture.",
                  qFollowUp: [
                    Question(ansText: "I’m going to take a Bachelor's degree in Architecture.", quesText: "Wow, how did that happen?",
                        qFollowUp: [
                          Question(ansText: " Everyone is recommending me to watch ‘The World's Most Extraordinary Homes’ on Netflix!", quesText: "Do you think anything can give you more perspective about your dream?  ",
                              qFollowUp: [
                                Question(ansText: "Actually, I don’t even have a Netflix subscription!", quesText: " Do you have everything ready to go down that road? ")])
                        ])]),
              Question(
                  quesText: "  Have you thought about what you want to do in the creative field?",
                  ansText: "  I’m confused between becoming a social media influencer and an architect.",
                  qFollowUp: [
                    Question(ansText: "I’ve always dreamed of being an influencer, but somehow I feel like I’m going to end up picking architecture.", quesText: "Do you think you have a closer affinity to one of them?",
                        qFollowUp: [
                          Question(ansText: " Well, I do think architecture is the stable option, but I’m more worried on the influencer aspect of my dream!", quesText: "Does anything particularly drive you towards it? ",
                              qFollowUp: [
                                Question(ansText: "I’m very passionate about it, but it’s not a stable path, and I have a long way to go!", quesText: " What’s worrying you about the influencer option? ",
                                    qFollowUp: [
                                      Question(ansText: "Haha, I actually just have to start, probably have to start taking care of my skin to look glamorous!", quesText: "  Do you have everything ready to pursue your dream? ")])])
                        ])])
            ]
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

///Used in taskintro.dart
List<List<dynamic>> taskIntroData = [
  [
    "Level 1",
    "Task 1",
    "Welcome to your first task. It is important to understand the person that you are designing a gift for. Let’s chat with them to get to know them!",
    " Tap on the question which you think is the right way of asking the person about their interests.",
    "When you looked at the giftee card, you already learnt a lot about them. You’ll be great at this!",
    "There are 5 questions.Tap continue when you are ready to play!",
    EmpathizeOneOne()
  ],
  [
    "Level 1",
    "Task 2",
    "Welcome to task 2. Now that you’ve learnt a bit about your giftee, let’s define their needs and wants to prioritise them.",
    "Each hoop represents a different gift. Shoot the ball into the hoop you think your receiver would like more!",
    "There are ${currentPersonaL1.likeChoices.length} categories.\n",
    "Tap continue when you are ready to play!",
    Basketball()
  ],
  [
    "Level 1",
    "Task 3",
    "Let’s dive into task 3. It’s time to think of all and any ideas for potential gifts for the giftee. Let’s play a game to list down some ideas.",
    "Pop the bubbles containing any and all ideas that seem like a gift that would suit your giftee.",
    "Do not worry about the feasability or cost of the gift.",
    "You have 5 seconds to pop as many bubbles as you can.\nTap continue when you are ready to play!",
    Ideate()
  ],
  [
    "Level 1",
    "Task 4",
    "Now that you have a good understanding of your receiver’s needs, let’s create a virtual prototype of your idea!",
    "Based on your learnings so far, select appropriate choices to build your prototype.",
    "You will be able to personalise your gift to best match your receiver.",
    "Let’s begin creating!",
    Prototype()
  ],
  [
    "Level 1",
    "Task 5",
    "You’ve reached the final stage. \nLet’s test your idea!",
    "Pull the lever to deliver the gift and test your solution!",
    "You will receive feedback on how well suited your ideas were.",
    "",
    Test()
  ],
  [
    "Level 2",
    "Task 1",
    "Welcome to your first task. It is important to understand the person that you are designing a gift for. Let’s chat with them to get to know them!",
    " Tap on the question which you think is the right way of asking the person about their interests.",
    "When you looked at the giftee card, you already learnt a lot about them. You’ll be great at this!",
    "There are 5 questions.Tap continue when you are ready to play!",
    EmpathizeOneOne()
  ],
  [
    "Level 2",
    "Task 2",
    "Welcome to task 2. Now that you’ve learnt a bit about your giftee, let’s define their needs and wants to prioritise them.",
    "Each hoop represents a different gift. Shoot the ball into the hoop you think your receiver would like more!",
    "There are ${currentPersonaL2.likeChoices.length} categories.\n",
    "Tap continue when you are ready to play!",
    Basketball()
  ],
  [
    "Level 2",
    "Task 3",
    "Let’s dive into task 3. It’s time to think of all and any ideas for potential gifts for the giftee. Let’s play a game to list down some ideas.",
    "Pop the bubbles containing any and all ideas that seem like a gift that would suit your giftee.",
    "Do not worry about the feasability or cost of the gift.",
    "You have 5 seconds to pop as many bubbles as you can.\nTap continue when you are ready to play!",
    Ideate()
  ],
  [
    "Level 2",
    "Task 4",
    "Now that you have a good understanding of your receiver’s needs, let’s create a virtual prototype of your idea!",
    "Based on your learnings so far, select appropriate choices to build your prototype.",
    "You will be able to personalise your gift to best match your receiver.",
    "Let’s begin creating!",
    Prototype()
  ],
  [
    "Level 2",
    "Task 5",
    "You’ve reached the final stage. \nLet’s test your idea!",
    "Pull the lever to deliver the gift and test your solution!",
    "You will receive feedback on how well suited your ideas were.",
    "",
    Test()
  ],
];

///Used in informationCard.dart
List<List<dynamic>> infoCardData = [
  [
    "In this task you learnt the first step of design thinking",
    "Empathise",
    "To empathise means to understand and share the feelings of another person. In the design thinking process, one can empathise by creating a survey and asking the right type of questions. We must let the user talk about a problem freely, without asking too many leading questions.",
  ],
  [
    "In this task you learnt the second step of design thinking",
    "Define",
    "Defining a problem statement is the most important part in solving a problem. After empathising with people, we need to identify potential pain points. Post this, we narrow down to the pressing need of the hour and define what our problem statement will be.",
  ],
  [
    "In this task you learnt the third step of design thinking",
    "Ideate",
    "Ideation is the third stage of design thinking. Thinking from multiple perspectives is a very key part of solving a problem. To ideate, one should have an open mind and should recollect the empathy stage. This way, we remember what the pain points are and come up with solutions to solve them in specific.",
  ],
  [
    "In this task you learnt the fourth step of design thinking",
    "Prototype",
    "Prototyping is an essential part of design thinking. We need to know what features to include or avoid based on the empathy stage. Prototyping ensures that we don’t waste a lot of resources on unnecessary objects or features.",
  ],
  [
    "In this task you learnt the fifth step of design thinking",
    "Testing",
    "Testing is the final stage of design thinking. It is very crucial to know if the solution we have at hand actually solves the problem we are facing. The best judge of this would be the people who face the problem first hand.",
  ],
  [
    "In this task you learnt the first step of design thinking",
    "Empathise",
    "To empathise means to understand and share the feelings of another person. In the design thinking process, one can empathise by creating a survey and asking the right type of questions. We must let the user talk about a problem freely, without asking too many leading questions.",
  ],
  [
    "In this task you learnt the second step of design thinking",
    "Define",
    "Defining a problem statement is the most important part in solving a problem. After empathising with people, we need to identify potential pain points. Post this, we narrow down to the pressing need of the hour and define what our problem statement will be.",
  ],
  [
    "In this task you learnt the third step of design thinking",
    "Ideate",
    "Ideation is the third stage of design thinking. Thinking from multiple perspectives is a very key part of solving a problem. To ideate, one should have an open mind and should recollect the empathy stage. This way, we remember what the pain points are and come up with solutions to solve them in specific.",
  ],
  [
    "In this task you learnt the fourth step of design thinking",
    "Prototype",
    "Prototyping is an essential part of design thinking. We need to know what features to include or avoid based on the empathy stage. Prototyping ensures that we don’t waste a lot of resources on unnecessary objects or features.",
  ],
  [
    "In this task you learnt the fifth step of design thinking",
    "Testing",
    "Testing is the final stage of design thinking. It is very crucial to know if the solution we have at hand actually solves the problem we are facing. The best judge of this would be the people who face the problem first hand.",
  ],
];



final totalQuizPossibleScore = 11;
///When you update catchTheNutMap, you also need to increase the above to the max possible score
final catchTheNutMap =
{"What are the steps of Design Thinking Process?":{"Define":true,"Prototype":true,"Draw":false, "Empathise":true, "Try":false, "Ideate":true,"Test":true,"Produce":false},
  "What are the elements of Innovation?":{"Originality":false,"Viability":true,"Feasibility":true,"Technicality":false,"Profitability":false,"Desirability":true},
  "Which ones resonate with the Empathy Stage?":{"Interviews":true,"Understand user":true,"Solution Mock-up":false, "User Shadowing":true}};


