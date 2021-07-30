import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'food app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: FoodList());
  }
}

class FoodList extends StatelessWidget {
  final List<FoodItem> foodItems = [
    FoodItem(
      name: 'alnsa toffee',
      time: '3',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8sfVVRNPFQ0HzREK7-eiZWgqO8CvwRDozkyOZ953bJ4OSkIhEt3WmVniNuZoZq4S8NV0&usqp=CAU',
      recipe: [
        'boil oil',
        'peel of the fruit',
        'drop them in and let it sizzle'
      ],
    ),
    FoodItem(
      name: 'alnsa toffee',
      time: '3',
      image:
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR8sfVVRNPFQ0HzREK7-eiZWgqO8CvwRDozkyOZ953bJ4OSkIhEt3WmVniNuZoZq4S8NV0&usqp=CAU',
      recipe: [
        'boil oil',
        'peel of the fruit',
        'drop them in and let it sizzle'
      ],
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('the menu'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: foodItems.length,
        itemBuilder: (context, index) =>
            FoodItemWidget(foodItem: foodItems[index]),
      ),
    );
  }
}

class FoodItemWidget extends StatelessWidget {
  const FoodItemWidget({
    Key? key,
    required this.foodItem,
  }) : super(key: key);

  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(foodItem.image!),
        ),
        title: Text(foodItem.name!),
        subtitle: Text('prepare time: ${foodItem.time}hrs'),
        onTap: () {
          Navigator.of(context).push<void>(
            MaterialPageRoute<void>(
              builder: (BuildContext context) => FoodView(foodItem: foodItem),
            ),
          );
        },
      ),
    );
  }
}

class FoodView extends StatelessWidget {
  const FoodView({Key? key, required this.foodItem}) : super(key: key);
  final FoodItem foodItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(foodItem.image!), fit: BoxFit.cover)),
          ),
          SizedBox(height: 20),
          Text(
            foodItem.name!,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 20),
          Text(
            'Time required: ${foodItem.time}',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: 20),
          Container(
            height: 200,
            color: Colors.grey.shade300,
            padding: EdgeInsets.all(10),
            // margin: EdgeInsets.all(20),
            child: ListView.builder(
              padding: EdgeInsets.all(0),
              itemCount: foodItem.recipe!.length,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      child: Text((index + 1).toString()),
                    ),
                    SizedBox(width: 10),
                    Text(foodItem.recipe![index]),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FoodItem {
  String? name;
  String? image;
  String? time;
  List<String>? recipe;

  FoodItem({
    this.image,
    this.name,
    this.recipe,
    this.time,
  });
}
