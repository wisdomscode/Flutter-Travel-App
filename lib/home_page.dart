import 'package:flutter/material.dart';
import 'package:starterapp/models/dommy_category.dart';
import 'package:starterapp/widgets/category_card.dart';
import 'package:starterapp/widgets/custom_text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String selectCategory;

  @override
  void initState() {
    super.initState();
    selectCategory = 'Technology';
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        // floatingActionButton: FloatingActionButton(onPressed: () {}),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          child: Column(
            children: [
              // User detail
              const Row(
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
              const Padding(
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

              const SizedBox(height: 20),
              // Category
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextWidget(
                    text: 'Popular Places',
                    size: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const CustomTextWidget(
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
                      onTap: () {
                        print("Category clicked ${category['name']}");
                        setState(() {
                          selectCategory = category['name']!;
                        });
                      },
                      name: category['name']!,
                      icon: category['icon']!,
                      bgColor: selectCategory == category['name'] ? Colors.black : null,
                      textColor: selectCategory == category['name'] ? Colors.white : null,
                    );
                  },
                ),
              ),

              SizedBox(height: 20),

              // Destination cards
              SizedBox(
                height: 300,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    // final category = categories[index];
                    return Stack(
                      children: [
                        Container(
                          width: 250,
                          height: 300,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(20),
                            image: const DecorationImage(
                              image: AssetImage('assets/images/intro.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          right: 20,
                          top: 20,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20)),
                            child: const Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Container(
                                width: 210,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 8, 59, 100).withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          CustomTextWidget(
                                            text: 'Mount Fuji',
                                            color: Colors.white,
                                          ),
                                          SizedBox(width: 10),
                                          CustomTextWidget(
                                            text: 'Tokyo',
                                            color: Colors.grey.shade400,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
                          ),
                        ),
                      ],
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
