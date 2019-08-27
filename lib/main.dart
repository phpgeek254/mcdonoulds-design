import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'McDonoulds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage();
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TopBar(),
              TopBarLevel2(),
              ListingAndCart(),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Text(
                  "Popular",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              // ! Botton part
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      flex: 3,
                      child: Container(
                        child: GridView(
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 4,
                          ),
                          children: <Widget>[
                            new BottomGridListTile(),
                            new BottomGridListTile(),
                            new BottomGridListTile(),
                            new BottomGridListTile(),
                            new BottomGridListTile(),
                            new BottomGridListTile(),
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text("Total"),
                            Text(
                              "\$13.86",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 24),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.yellow[500],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(20),
                              child: Center(child: Text("DONE")),
                            ),
                          ],
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
    );
  }
}

class BottomGridListTile extends StatelessWidget {
  const BottomGridListTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              height: 40,
              width: 40,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Happy Meal \n \$ 3.799",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 10),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListingAndCart extends StatelessWidget {
  const ListingAndCart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      height: 400,
      child: Row(
        children: <Widget>[
          new Listing(),
          new Cart(),
        ],
      ),
    );
  }
}

class Cart extends StatelessWidget {
  const Cart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 1,
      child: Container(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            new OrderItem(),
            new OrderItem(),
            new OrderItem(),
            new OrderItem(),
            new OrderItem(),
            new OrderItem(),
            new OrderItem(),
            new OrderItem(),
          ],
        ),
      ),
    );
  }
}

class Listing extends StatelessWidget {
  const Listing({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: 2,
      child: Container(
        child: GridView(
          children: <Widget>[
            new ListingGridTile(
              isActive: true,
            ),
            new ListingGridTile(),
            new ListingGridTile(),
            new ListingGridTile(),
            new ListingGridTile(),
            new ListingGridTile(),
            new ListingGridTile(),
            new ListingGridTile(),
          ],
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 4, mainAxisSpacing: 20),
        ),
      ),
    );
  }
}

class ListingGridTile extends StatelessWidget {
  final isActive;
  const ListingGridTile({this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isActive ? Colors.red[900] : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              height: 60,
              width: 60,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Happy Meal",
                  style:
                      TextStyle(color: isActive ? Colors.white : Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderItem extends StatelessWidget {
  const OrderItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      margin: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          Image.asset(
            'images/logo.png',
            height: 60,
            width: 60,
          ),
          SizedBox(
            height: 10,
          ),
          Text("Big Mac"),
          Text("\$ 3.799"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.remove,
                  size: 16,
                ),
                onPressed: () {},
              ),
              Text("2"),
              InkWell(
                onTap: () {},
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(20)),
                  child: Icon(
                    Icons.add,
                    size: 16,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class TopBarLevel2 extends StatelessWidget {
  const TopBarLevel2({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Hey,",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "What's up?",
                style: TextStyle(
                  fontFamily: 'Quicksand',
                  color: Colors.black,
                  fontSize: 36,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "My \n Order",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Text("Take out"),
            ],
          ),
        ],
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            'images/logo.png',
            height: 60,
            width: 60,
          ),
          Image.asset(
            'images/flag.jpeg',
            height: 60,
            width: 60,
          ),
        ],
      ),
    );
  }
}
