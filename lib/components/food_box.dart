import 'package:flutter/material.dart';
import '../pages/menu_detail_page.dart';

class FoodBox extends StatelessWidget {
  String name;
  String price;
  String description;
  String imageAsset;
  String review;
  String imageReview;
  FoodBox(
      {required this.name,
      required this.price,
      required this.description,
      required this.imageAsset,
      required this.review,
      required this.imageReview});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuDetailPage(
                    name: name,
                    description: description,
                    review: review,
                    imageReview: imageReview,
                    imageAsset: imageAsset,
                    price: price,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  bottom: 16.0,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      imageAsset,
                      width: 100.0,
                      height: 100.0,
                    ),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      price,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        color: Color.fromRGBO(133, 187, 101, 1),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(description),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    print('Oi');
                  },
                  child: Container(
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.orange,
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 20.0,
                      color: Colors.orange,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
