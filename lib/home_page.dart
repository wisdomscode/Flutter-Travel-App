import 'package:flutter/material.dart';
import 'package:starterapp/widgets/category_card.dart';
import 'package:starterapp/widgets/custom_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, String>> categories = [
    {'name': 'Technology', 'icon': '💻'},
    {'name': 'Science', 'icon': '🔬'},
    {'name': 'Art', 'icon': '🎨'},
    {'name': 'Sports', 'icon': '⚽'},
    {'name': 'Music', 'icon': '🎵'},
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(onPressed: () {}),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              // User detail
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi David',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Explore the World',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  // Container(
                  //   width: 130,
                  //   height: 130,
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     image: DecorationImage(image: AssetImage('assets/images/profile2.jpg'), fit: BoxFit.fill),
                  //   ),
                  // ),
                  Spacer(),
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey,
                    backgroundImage: AssetImage("assets/images/profile2.jpg"),
                  )
                ],
              ),

              // Text field
              Padding(
                padding: EdgeInsets.only(top: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                    // labelText: 'Full Name',
                    hintText: 'Enter your name',
                    contentPadding: EdgeInsets.only(left: 20),
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: Icon(Icons.tune),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2.0, color: Colors.blue),
                      borderRadius: BorderRadius.all(
                        Radius.circular(30),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),
              // Category
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomTextWidget(
                    text: 'Popular Places',
                    size: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: CustomTextWidget(
                      text: 'View All',
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),

              // ElevatedButton(
              //   onPressed: () {},
              //   child: const Text('Click'),
              //   style: ElevatedButton.styleFrom(
              //     foregroundColor: Colors.red,
              //     backgroundColor: Colors.black,
              //     minimumSize: Size(width, 40),
              //   ),
              // ),
              // TextButton(
              //   onPressed: () {
              //     print('Button Pressed');
              //   },
              //   child: Text('click'),
              // ),

              // Horizontal Scroll
              // SizedBox(
              //   width: double.infinity,
              //   height: 60,
              //   child: Row(
              //     children: [
              //       Container(
              //         margin: EdgeInsets.only(right: 10),
              //         decoration: BoxDecoration(
              //           color: Colors.black,
              //           shape: BoxShape.rectangle,
              //           borderRadius: BorderRadius.circular(20),
              //         ),
              //         child: const Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              //           child: CustomTextWidget(
              //             text: 'Most Viewed',
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //       Container(
              //         margin: EdgeInsets.only(right: 10),
              //         decoration: BoxDecoration(
              //           color: Colors.black,
              //           shape: BoxShape.rectangle,
              //           borderRadius: BorderRadius.circular(20),
              //         ),
              //         child: const Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              //           child: CustomTextWidget(
              //             text: 'Most Viewed',
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //       Container(
              //         margin: EdgeInsets.only(right: 10),
              //         decoration: BoxDecoration(
              //           color: Colors.black,
              //           shape: BoxShape.rectangle,
              //           borderRadius: BorderRadius.circular(20),
              //         ),
              //         child: const Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              //           child: CustomTextWidget(
              //             text: 'Most Viewed',
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //       Container(
              //         margin: EdgeInsets.only(right: 10),
              //         decoration: BoxDecoration(
              //           color: Colors.black,
              //           shape: BoxShape.rectangle,
              //           borderRadius: BorderRadius.circular(20),
              //         ),
              //         child: const Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              //           child: CustomTextWidget(
              //             text: 'Most Viewed',
              //             color: Colors.white,
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CategoryCard(
                      name: category['name']!,
                      icon: category['icon']!,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
