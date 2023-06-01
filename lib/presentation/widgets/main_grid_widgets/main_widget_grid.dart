import 'package:easacc_task/presentation/controller/services_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_widget_grid_card.dart';

class MainWidgetGrid extends StatelessWidget {
  const MainWidgetGrid({super.key});

  @override
  Widget build(BuildContext context) {

    //services names and icons
    List<String> services = [
      'Camera', 'Printer', 'Bluetooth',
      'USB'
    ];
    List<IconData> icons = [
      Icons.camera_alt,
      Icons.print,
      Icons.bluetooth,
      Icons.usb
    ];
    ///////

    //grid of fixed 4 services
    return GridView.count(crossAxisCount:
    2,
      children: List.generate(4, (index) => MainWidgetGridCard(
        title: services[index],
        iconData: icons[index],
        onTap: (){
          print(index);
          if(index == 0){
            context.read<ServicesBloc>().add(const CheckCameraEvent());
          }else if(index == 1){
            context.read<ServicesBloc>().add(const CheckPrinterEvent());
          }else if(index == 2){
            context.read<ServicesBloc>().add(const CheckBluetoothEvent());
          }else{
            context.read<ServicesBloc>().add(const CheckUsbEvent());
          }
        },
      )),
    );
  }
}
