import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';

class MainWidgetGridCard extends StatelessWidget {
  const MainWidgetGridCard(
      {super.key,
      required this.title,
      required this.iconData,
      required this.onTap});

  final String title;
  final IconData iconData;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: BlurryContainer(
          height: 80,
          blur: 5,
          color: Colors.white.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                iconData,
                color: Theme.of(context).secondaryHeaderColor,
                size: 60,
              ),
              Text(
                title,
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
