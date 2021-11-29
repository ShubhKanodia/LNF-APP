List<String> siloTextOptions = ["Sell"];

class BMCElement{
  String name;
  int score;
  bool selected;
  BMCElement({
    this.name,this.score,this.selected
});

  Map toJson() => {
    'name': name,
    'score': score,
    'selected':selected,
};
}

Map<String,List<BMCElement>> farmScores = {
  "Key Partners": [
    BMCElement(name: "Retail Partnerships/Grocers", score: 5, selected: false),
    BMCElement(name: "Food Quality Certifiers", score: 5, selected: false),
    BMCElement(name: "Packaging and Delivery Partners", score: 5, selected: false),
    BMCElement(name: "Online retailers", score: 5, selected: false),
    BMCElement(name: "Marketing Consultant", score: 0, selected: false),
    BMCElement(name: "Doctors/Health Specialists", score: 0, selected: false),
    BMCElement(name: "Consumers", score: -5, selected: false),
    BMCElement(name: "Labourers", score: -5, selected: false),
  ],
  "Value Proposition":[

  ]
};



