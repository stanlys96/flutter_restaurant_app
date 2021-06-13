import 'package:flutter/material.dart';
import '../components/input_box.dart';

class MyInputBox {
  String title;
  Icon icon;
  MyInputBox({required this.title, required this.icon});
}

class InputPage extends StatelessWidget {
  String foodName = '';
  String price = '';
  String description = '';
  String foodImagePath = '';
  String review = '';
  String reviewImagePath = '';
  Function addingMeal;
  InputPage({required this.addingMeal});

  void changeVal(String title, String val) {
    if (title == 'Food Name') {
      foodName = val;
    } else if (title == 'Price') {
      price = val;
    } else if (title == 'Description') {
      description = val;
    } else if (title == 'Food Image Path') {
      foodImagePath = val;
    } else if (title == 'Review') {
      review = val;
    } else if (title == 'Review Image Path') {
      reviewImagePath = val;
    }
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
              top: 20.0, bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: EdgeInsets.all(25.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: const Radius.circular(10.0),
                topRight: const Radius.circular(10.0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 20.0,
                  ),
                  child: Text(
                    'Add Food',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      color: Color.fromRGBO(16, 46, 129, 1),
                    ),
                  ),
                ),
                for (var input in inputTypes)
                  InputBox(
                    title: input.title,
                    icon: input.icon,
                    changeVal: changeVal,
                  ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(193, 255, 62, 1),
                    ),
                    onPressed: () {
                      addingMeal(foodName, foodImagePath, price, description,
                          review, reviewImagePath);
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Color.fromRGBO(11, 43, 124, 1),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(242, 89, 81, 1),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
