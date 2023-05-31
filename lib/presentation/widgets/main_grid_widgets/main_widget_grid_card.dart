
import 'package:flutter/material.dart';

class MainWidgetGridCard extends StatelessWidget {
  const MainWidgetGridCard({super.key, required this.title, required this.iconData});
  final String title;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            color: Theme.of(context).secondaryHeaderColor,
            size: 60,
          ),
          Text(title, style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontSize: 16
          ),)
        ],
      ),
    );
  }
}
