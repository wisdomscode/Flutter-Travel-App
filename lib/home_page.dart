import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade200,
        leading: const Icon(Icons.menu),
        centerTitle: true,
        title: const Text('First App'),
        actions: const [
          Icon(
            Icons.notifications,
            size: 24,
            color: Colors.purple,
          ),
          Icon(Icons.person),
          SizedBox(width: 30),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.green.shade100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text('Hi! ', style: TextStyle(color: Colors.blue)),
                  Text('My name is ', style: TextStyle(color: Colors.red)),
                  Text('Wisdom', style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Container(
              color: Colors.pink.shade100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('John', style: TextStyle(color: Colors.green)),
                  Text('James', style: TextStyle(color: Colors.blue)),
                  Text('Johnson', style: TextStyle(color: Colors.red)),
                ],
              ),
            ),
            Text('John', style: TextStyle(color: Colors.green)),
            Text('James', style: TextStyle(color: Colors.blue)),
            Text('Johnson', style: TextStyle(color: Colors.red)),
            Image.asset('assets/images/gravatar.jpg'),
            Image.asset(
              'assets/images/intro.jpg',
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
