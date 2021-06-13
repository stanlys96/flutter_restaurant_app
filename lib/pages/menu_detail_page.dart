import 'package:flutter/material.dart';

class MenuDetailPage extends StatelessWidget {
  String name;
  String description;
  String review;
  String imageReview;
  String imageAsset;
  String price;
  MenuDetailPage(
      {required this.name,
      required this.description,
      required this.review,
      required this.imageReview,
      required this.imageAsset,
      required this.price});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(247, 245, 247, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Image.asset(
                        imageAsset,
                        height: 250.0,
                        width: 250.0,
                      ),
                    ),
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(133, 187, 101, 1),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(description),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      'Reviews',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 12.0,
                    ),
                    Container(
                      padding: EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(242, 242, 242, 1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15.0),
                        ),
                        border: Border.all(
                          color: Color.fromRGBO(235, 237, 239, 1),
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CircleAvatar(
                            radius: 20.0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50.0),
                              child: Image.asset(
                                imageReview,
                              ),
                            ),
                          ),
                          SizedBox(width: 15.0),
                          Expanded(
                            child: Text(
                              review,
                              style: TextStyle(
                                fontSize: 13.0,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 60.0,
                  right: 50.0,
                ),
                child: InkWell(
                  onTap: () {
                    print('Oi');
                  },
                  child: Container(
                    width: 40.0,
                    height: 40.0,
                    padding: EdgeInsets.all(4.0),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(253, 215, 61, 1),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 20.0,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
