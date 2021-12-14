import 'dart:ffi';

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

class FarmLandData{
  int vegetableCode=0;
  DateTime deadline;

  FarmLandData({
    this.vegetableCode=0,this.deadline
});

  @override
  String toString() {
    return "$vegetableCode harvesting at : $deadline";
  }

  Map toJson() => {
    'vegetable': vegetableCode,
    'deadline': deadline.millisecondsSinceEpoch
  };
}

int HalfwayTime = 3;
int totalTime = 10;

Map<String,List<BMCElement>> farmScores = {
  "Key Partners": [
    BMCElement(name: "Retail Partnerships/Grocers", score: 1, selected: false),
    BMCElement(name: "Food Quality Certifiers", score: 1, selected: false),
    BMCElement(name: "Packaging and Delivery Partners", score: 1, selected: false),
    BMCElement(name: "Online retailers", score: 1, selected: false),
    BMCElement(name: "Marketing Consultant", score: 0, selected: false),
    BMCElement(name: "Doctors/Health Specialists", score: 0, selected: false),
    BMCElement(name: "Consumers", score: -1, selected: false),
    BMCElement(name: "Labourers", score: -1, selected: false),
  ],
  "Value Proposition":[
    BMCElement(name: "Fresh and organic fruits and vegetables ", score: 1, selected: false),
    BMCElement(name: "Pesticide and insecticide free groceries ", score: 1, selected: false),
    BMCElement(name: "Groceries that have passed certified quality checks", score: 1, selected: false),
    BMCElement(name: "High-quality products", score: 0, selected: false),
    BMCElement(name: "Bad quality products", score: -1, selected: false),
    BMCElement(name: "Pesticides and Insecticides", score: -1, selected: false),
  ],
  "Customer Segments":[
    BMCElement(name: "Agriculture cooperative", score: 1, selected: false),
    BMCElement(name: "Fruits and Vegetable retailers", score: 1, selected: false),
    BMCElement(name: "Grocery Markets", score: 1, selected: false),
    BMCElement(name: "Health Conscious Individuals", score: 1, selected: false),
    BMCElement(name: "Online Quality conscious individuals", score: 0, selected: false),
    BMCElement(name: "Chefs", score: -1, selected: false),
    BMCElement(name: "Doctors", score: -1, selected: false),
  ],
  "Channels":[
    BMCElement(name: "Social Networks of Grocers and Markets", score: 1, selected: false),
    BMCElement(name: "Promotional campaigns of Farmers’ Union", score: 1, selected: false),
    BMCElement(name: "Website", score: 0, selected: false),
    BMCElement(name: "Stakeholder meetings", score: -1, selected: false),
    BMCElement(name: "Hotline for discussions ", score: -1, selected: false),
  ],
  "Customer Relationships":[
    BMCElement(name: "Bulk buyers/Loyalty Discounts", score: 1, selected: false),
    BMCElement(name: "Customer Support", score: 1, selected: false),
    BMCElement(name: "High transparency to consumers, partners", score: 1, selected: false),
    BMCElement(name: "Referral Discounts ", score: 0, selected: false),
    BMCElement(name: "Free distribution of fruits and vegetables ", score: -1, selected: false),
    BMCElement(name: "Criticizing other farm products", score: -1, selected: false),
  ],
  "Revenue":[
    BMCElement(name: "Product Sales ", score: 1, selected: false),
    BMCElement(name: "Franchising Fees", score: 1, selected: false),
    BMCElement(name: "Adsense", score: 0, selected: false),
    BMCElement(name: "Equipments", score: -1, selected: false),
  ],
  "Key resources":[
    BMCElement(name: "Labourers", score: 1, selected: false),
    BMCElement(name: "Land/Fertilizer/Harvesters", score: 1, selected: false),
    BMCElement(name: "Financial capital", score: 1, selected: false),
    BMCElement(name: "Web Developers", score: 0, selected: false),
    BMCElement(name: "Quality Certifiers", score: -1, selected: false),
    BMCElement(name: "Photographers", score: -1, selected: false),
  ],
  "Key activities":[
    BMCElement(name: "Farm Planning", score: 1, selected: false),
    BMCElement(name: "Capital Management", score: 1, selected: false),
    BMCElement(name: "Skilling/Training for new labourers", score: 1, selected: false),
    BMCElement(name: "Harvesting", score: 0, selected: false),
    BMCElement(name: "Packaging & Delivery", score: -1, selected: false),
    BMCElement(name: "SEO Optimization for Website", score: -1, selected: false),
    BMCElement(name: "One on one interactions with customers", score: -1, selected: false),
  ],
  "Cost structure":[
    BMCElement(name: "Organic Fertilizers/Manure", score: 1, selected: false),
    BMCElement(name: "Labour Cost", score: 1, selected: false),
    BMCElement(name: "Equipment costs", score: 1, selected: false),
    BMCElement(name: "Land Cost", score: 1, selected: false),
    BMCElement(name: "Marketing Costs", score: -1, selected: false),
    BMCElement(name: "Sales", score: -1, selected: false),

  ],

};



