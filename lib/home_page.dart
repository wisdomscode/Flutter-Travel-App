import 'package:flutter/material.dart';
import 'package:starterapp/models/dommy_category.dart';
import 'package:starterapp/models/dommy_destinations.dart';
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
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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

                // Popular Destinations
                CustomTextWidget(
                  text: 'Popular Destinations',
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: places.length,
                    itemBuilder: (context, index) {
                      Map<String, dynamic> place = places[index];
                      return Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 250,
                              height: 300,
                              decoration: BoxDecoration(
                                color: Colors.greenAccent,
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(place['image']),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                                    spreadRadius: 2, // How much the shadow spreads
                                    blurRadius: 10, // Softness of the shadow
                                    offset: Offset(3, 3), // Horizontal and vertical shadow offset
                                  ),
                                ],
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
                            bottom: 20,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                  width: 230,
                                  height: 70,
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
                                              text: place['title'],
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 10),
                                            CustomTextWidget(
                                              text: place['city'],
                                              color: Colors.grey.shade400,
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                // Icon(Icons.location_on),
                                                Icon(
                                                  Icons.place_outlined,
                                                  color: Colors.white,
                                                  size: 18,
                                                ),
                                                SizedBox(width: 5),

                                                CustomTextWidget(
                                                  text: place['city'],
                                                  color: Colors.white,
                                                ),
                                                SizedBox(width: 10),
                                                CustomTextWidget(
                                                  text: place['country'],
                                                  color: Colors.grey.shade400,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star_border,
                                                  color: Colors.white,
                                                  size: 18,
                                                ),
                                                SizedBox(width: 5),
                                                CustomTextWidget(
                                                  text: '4.5',
                                                  color: Colors.white,
                                                ),
                                              ],
                                            )
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
                ),

                SizedBox(height: 20),

                // All destination
                CustomTextWidget(
                  text: 'All Destination',
                  size: 20,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    itemCount: destinations.length,
                    itemBuilder: (context, index) {
                      final destination = destinations[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        elevation: 5,
                        child: ListTile(
                          leading: Image.asset(
                            destination.image,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          title: Text(destination.title),
                          subtitle: Text(destination.description),
                          trailing: ElevatedButton.icon(onPressed: () {}, label: Text('View')),
                          onTap: () {
                            // You can navigate to a detailed page or show more info here.
                          },
                        ),
                      );
                    },
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
