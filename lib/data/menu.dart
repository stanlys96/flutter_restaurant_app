class Meal {
  String name;
  String imageAsset;
  String price;
  String description;
  String review;
  String imageReview;

  Meal(
      {required this.name,
      required this.imageAsset,
      required this.price,
      required this.description,
      required this.review,
      required this.imageReview});
}

class MealsList {
  List mealsList = [
    Meal(
      name: 'Big Mac Combo',
      imageAsset: 'images/big-mac.png',
      price: 'Rp 35.000,00',
      description: 'Junk Food, French Fries, Cheeseburger',
      review:
          'This cozy restaurant has left the best impressions! Hospitable hosts, delicious dishes, beautiful presentation, wide wine list and wonderful dessert. I recommend to everyone! I would like to come back here again and again.',
      imageReview: 'images/person_1.jpeg',
    ),
    Meal(
      name: 'Chicken Combo',
      imageAsset: 'images/fried-chicken.png',
      price: 'Rp 50.000,00',
      description: 'Chicken, French Fries, Fanta',
      review:
          'First time in (RN) and YOU have to go! It’s the cutest little spot with amazing food. The (FN) is to die for. IT WAS FIRE!! The service we received was so amazing and we will definitely be back again. They made us feel welcomed and gave us an amazing experience.',
      imageReview: 'images/person_2.jpeg',
    ),
    Meal(
      name: 'Burrito',
      imageAsset: 'images/burrito.png',
      price: 'Rp 20.000,00',
      description: 'Burrito with lamb and salad',
      review:
          'It’s a great experience. The ambiance is very welcoming and charming. Amazing wines, food and service. Staff are extremely knowledgeable and make great recommendations.',
      imageReview: 'images/person_3.jpeg',
    ),
    Meal(
      name: 'French Fries',
      imageAsset: 'images/french-fries.png',
      price: 'Rp 23.000,00',
      description: 'Good for snacks!',
      review:
          'Stopped in for dinner and had a great meal. Staff was helpful and knowledgeable about the menu offering great recommendations. The atmosphere is cozy and pleasant. The dishes were delicious as were the wine and cocktail recommendations.',
      imageReview: 'images/person_4.jpeg',
    ),
    Meal(
      name: 'Hot Dog',
      imageAsset: 'images/hotdog.png',
      price: 'Rp 20.000,00',
      description: 'Yummy hotdog with great sauce!',
      review:
          'A small local restaurant with great service, food, and overall experience! Definitely a go-to place for (FN) when you are in (CN)! Huge variety of (FN) to choose from & side dishes are delicious as well.',
      imageReview: 'images/person_5.jpeg',
    ),
    Meal(
      name: 'Salad',
      imageAsset: 'images/salad.png',
      price: 'Rp 25.000,00',
      description: 'Good for your body!',
      review:
          'This spot gives extraordinary service and yummy meals. One of my favourite restaurants around town. The meals served rapidly and the rates were reasonable. Highly recommended.',
      imageReview: 'images/person_6.jpeg',
    ),
    Meal(
      name: 'Seafood Combo',
      imageAsset: 'images/seafood.png',
      price: 'Rp 75.000,00',
      description: 'Fish, oyesters and shrimp!',
      review:
          'Delicious food, waiters are very attentive, and super nice atmosphere. Plus it’s all at an affordable price. Can totally recommend it and will definitely come back again.',
      imageReview: 'images/person_7.jpeg',
    ),
    Meal(
      name: 'Spaghetti',
      imageAsset: 'images/spaghetti.png',
      price: 'Rp 45.000,00',
      description: 'Tongue twisting spaghetti bolognaise!',
      review:
          'Amazing experience! If you thought gourmet kitchen will leave you hungry, think again. You should skip several meals before visiting this amazing restaurant. Everything is so tasty, you cannot restraint yourself from having all of the dishes.',
      imageReview: 'images/person_8.jpg',
    ),
  ];
  void addMeal(String name, String imageAsset, String price, String description,
      String review, String imageReview) {
    mealsList.add(
      Meal(
        name: name,
        imageAsset: imageAsset,
        price: price,
        description: description,
        review: review,
        imageReview: imageReview,
      ),
    );
  }
}
