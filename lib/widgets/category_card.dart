import 'package:flutter/material.dart';
import 'package:starterapp/widgets/custom_text_widget.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key,
    required this.name,
    required this.icon,
    required this.onTap,
    this.bgColor,
    this.textColor,
  });

  final String name;
  final String icon;
  final VoidCallback onTap;
  final Color? bgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 5,
          color: bgColor,
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
                  color: textColor,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
