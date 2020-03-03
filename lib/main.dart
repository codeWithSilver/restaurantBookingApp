import 'package:flutter/material.dart';

void main() {
  runApp(MyRestaurantBooking());
}

class MyRestaurantBooking extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 25.0, top: 45.0, right: 25.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Discover",
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.pexels.com/photos/2787310/pexels-photo-2787310.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=750&w=1260"),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    height: 40.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        buildTopChip("healthy", true),
                        buildTopChip("italian", false),
                        buildTopChip("mexican", false),
                        buildTopChip("asian", false),
                        buildTopChip("chinese", false),
                        buildTopChip("haitian", false),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              child: Expanded(
                  child: ListView(
                children: <Widget>[
                  buildItem(
                      "Joe's Linder",
                      "123 reviews = S. Oxford 13th",
                      "https://images.pexels.com/photos/3676531/pexels-photo-3676531.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                      4.5),
                  buildItem(
                      "Mama's brunch",
                      "98 reviews = S. Gulier 6th",
                      "https://images.pexels.com/photos/1147993/pexels-photo-1147993.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                      4.5),
                  buildItem(
                      "Joe's Linder",
                      "123 reviews = S. Oxford 13th",
                      "https://images.pexels.com/photos/842571/pexels-photo-842571.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
                      4.5),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }

  Container buildItem(
      String title, String subTitle, String url, double rating) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12.0),
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 200,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(url),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                
                  topLeft: Radius.circular(10.0),  
                  topRight: Radius.circular(10.0),
                )),
          ),
          Container(
            padding: EdgeInsets.all(25.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                      blurRadius: 2.0, spreadRadius: 1.0, color: Colors.grey)
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                    Text(
                      subTitle,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12.0,
                          color: Colors.grey),
                    ),
                  ],
                ),
                CircleAvatar(
                  backgroundColor: Colors.orange,
                  child: Text(
                    rating.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildTopChip(String label, bool isActive) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Chip(
        padding: EdgeInsets.all(8.0),
        label: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        backgroundColor: isActive ? Colors.orange : Colors.grey,
      ),
    );
  }
}
