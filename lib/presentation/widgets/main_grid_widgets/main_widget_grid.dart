import 'package:flutter/material.dart';

import 'main_widget_grid_card.dart';

class MainWidgetGrid extends StatelessWidget {
  const MainWidgetGrid({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> services = [
      'Camera', 'Check url', 'Bluetooth',
      'USB'
    ];
    List<IconData> icons = [
      Icons.camera_alt,
      Icons.web,
      Icons.bluetooth,
      Icons.usb
    ];

    return GridView.count(crossAxisCount:
    2,
      children: List.generate(4, (index) => MainWidgetGridCard(title: services[index],
        iconData: icons[index],
      )),
    );
  }
}
