import 'package:flutter/material.dart';
import 'package:starterapp/widgets/custom_text_widget.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.name,
    required this.icon,
  });

  final String name;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        child: SizedBox(
          width: 110,
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey.shade300,
                child: Text(
                  icon,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(height: 8),
              CustomTextWidget(
                text: name,
                fontWeight: FontWeight.bold,
                size: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
