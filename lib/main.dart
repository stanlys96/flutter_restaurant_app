import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'data/menu.dart';
import 'components/food_box.dart';
import 'components/type_box.dart';
import './pages/add_food_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: MyHomePage(),
    );
  }
}

List makeNestedList(List list) {
  List output = [];
  List temp = [];
  for (int i = 0; i < list.length; i++) {
    if (i % 2 == 0 && i != 0) {
      output.add(temp);
      temp = [];
    }
    temp.add(list[i]);
  }
  output.add(temp);
  return output;
}

class MyInputBox {
  String title;
  Icon icon;
  MyInputBox({required this.title, required this.icon});
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class Type {
  String type;
  bool isTapped;
  Type({required this.type, this.isTapped = false});
  void changeIsTapped() {
    isTapped = !isTapped;
  }
}

class _MyHomePageState extends State<MyHomePage> {
  MealsList meals = MealsList();
  List<Type> types = [
    Type(type: 'Indian'),
    Type(type: 'Chinese'),
    Type(type: 'Western'),
    Type(type: 'Snacks'),
  ];
  List<MyInputBox> inputTypes = [
    MyInputBox(
      title: 'Food Name',
      icon: Icon(
        Icons.fastfood,
        color: Color.fromRGBO(155, 163, 176, 1),
      ),
    ),
    MyInputBox(
      title: 'Price',
      icon: Icon(
        Icons.attach_money,
        color: Color.fromRGBO(155, 163, 176, 1),
      ),
    ),
    MyInputBox(
      title: 'Description',
      icon: Icon(
        Icons.text_snippet_outlined,
        color: Color.fromRGBO(155, 163, 176, 1),
      ),
    ),
    MyInputBox(
      title: 'Food Image Path',
      icon: Icon(
        Icons.image_rounded,
        color: Color.fromRGBO(155, 163, 176, 1),
      ),
    ),
    MyInputBox(
      title: 'Review',
      icon: Icon(
        Icons.rate_review,
        color: Color.fromRGBO(155, 163, 176, 1),
      ),
    ),
    MyInputBox(
      title: 'Review Image Path',
      icon: Icon(
        Icons.image,
        color: Color.fromRGBO(155, 163, 176, 1),
      ),
    ),
  ];
  void changeState(String title) {
    setState(() {
      for (int i = 0; i < types.length; i++) {
        if (types[i].type == title) {
          types[i].changeIsTapped();
        } else {
          types[i].isTapped = false;
        }
      }
    });
  }

  void addingMeal(String name, String imageAsset, String price,
      String description, String review, String imageReview) {
    setState(() {
      meals.addMeal(name, imageAsset, price, description, review, imageReview);
    });
  }

  @override
  Widget build(BuildContext context) {
    List listData = makeNestedList(meals.mealsList);
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Center(
          child: Text(
            'THE SPICYCAB',
            style: TextStyle(
              letterSpacing: 2,
            ),
          ),
        ),
        actions: [
          CircleAvatar(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50.0),
              child: Image.asset(
                'images/person_8.jpg',
              ),
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            height: 75.0,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: types.map((type) {
                return TypeBox(
                  title: type.type,
                  changeState: changeState,
                  color: type.isTapped
                      ? Color.fromRGBO(244, 89, 81, 1)
                      : Colors.white,
                  fontColor: type.isTapped ? Colors.white : Colors.black,
                );
              }).toList(),
              // types.map((type) {
              //   return TypeBox(title: type);
              // }).toList(),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 16.0,
              top: 12.0,
            ),
            child: Text(
              'Popular Menu',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 12.0,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(247, 245, 247, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    var meal = listData[index];
                    if (listData.length % 2 == 0) {
                      return IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: meal.map<FoodBox>((data) {
                            return FoodBox(
                              name: data.name,
                              description: data.description,
                              price: data.price,
                              imageAsset: data.imageAsset,
                              review: data.review,
                              imageReview: data.imageReview,
                            );
                          }).toList(),
                        ),
                      );
                    } else {
                      return Row(
                        children: meal.map<FoodBox>((data) {
                          return FoodBox(
                            name: data.name,
                            description: data.description,
                            price: data.price,
                            imageAsset: data.imageAsset,
                            review: data.review,
                            imageReview: data.imageReview,
                          );
                        }).toList(),
                      );
                    }
                  },
                  itemCount: listData.length,
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InputPage(
                addingMeal: addingMeal,
              ),
            ),
          );
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// showModalBottomSheet(
// isScrollControlled: true,
// context: context,
// builder: (builder) {
// return SingleChildScrollView(
// child: Container(
// padding: EdgeInsets.only(
// bottom: MediaQuery.of(context).viewInsets.bottom),
// color: Color(
// 0xFF737373), //could change this to Color(0xFF737373),
// child: Container(
// padding: EdgeInsets.all(25.0),
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.only(
// topLeft: const Radius.circular(10.0),
// topRight: const Radius.circular(10.0),
// ),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisSize: MainAxisSize.min,
// children: [
// Padding(
// padding: const EdgeInsets.only(
// bottom: 20.0,
// ),
// child: Text(
// 'Add Food',
// textAlign: TextAlign.center,
// style: TextStyle(
// fontSize: 20.0,
// fontWeight: FontWeight.w700,
// color: Color.fromRGBO(16, 46, 129, 1),
// ),
// ),
// ),
// for (var input in inputTypes)
// InputBox(
// title: input.title,
// icon: input.icon,
// ),
// Container(
// width: double.infinity,
// child: ElevatedButton(
// style: ElevatedButton.styleFrom(
// primary: Color.fromRGBO(193, 255, 62, 1),
// ),
// onPressed: () {
// Navigator.pop(context);
// },
// child: Text(
// 'Submit',
// style: TextStyle(
// color: Color.fromRGBO(11, 43, 124, 1),
// ),
// ),
// ),
// )
// ],
// ),
// ),
// ),
// );
// },
// );
