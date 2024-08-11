class FoodItem {
  final String image;
  final String foodType;
  final double review;
  final double cost;
  final String offer;
  final String arrivalMins;
  final String extraOffer;
  final String foodname;
  final String additionalFood;
  final double foodCost;

  FoodItem(
      {required this.image,
      required this.foodType,
      required this.review,
      required this.cost,
      required this.offer,
      required this.arrivalMins,
      required this.extraOffer,
      required this.foodname,
      required this.additionalFood,
      required this.foodCost});

  // Method to create a FoodItem instance from JSON
  factory FoodItem.fromJson(Map<String, dynamic> json) {
    return FoodItem(
      image: json['image'],
      foodType: json['foodType'],
      review: json['review'].toDouble(),
      cost: json['cost'].toDouble(),
      offer: json['offer'],
      arrivalMins: json['arrivalMins'],
      extraOffer: json["extraOffer"],
      foodname: json["foodname"],
      additionalFood: json["additionalFood"],
      foodCost: json["foodCost"],
    );
  }

  // Method to convert a FoodItem instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'foodType': foodType,
      'review': review,
      'cost': cost,
      'offer': offer,
      'arrivalMins': arrivalMins,
      'foodname': foodname,
      'additionalFood': additionalFood,
      'foodCost': foodCost,
    };
  }
}
