import 'package:easacc_task/presentation/widgets/main_grid_widgets/main_widget_grid_card.dart';
import 'package:flutter/material.dart';

import '../widgets/main_grid_widgets/main_widget_grid.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Text('Easacc Task', style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
          fontSize: 25
        ),),
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 14, right: 14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Theme.of(context).primaryColor.withOpacity(0.4), Colors.transparent],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,

          )
        ),
        width: double.infinity,
        height: double.infinity,
        child: const MainWidgetGrid()
      ),
    );
  }
}
