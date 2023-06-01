import 'package:easacc_task/core/utils/enums.dart';
import 'package:easacc_task/presentation/controller/services_bloc.dart';
import 'package:easacc_task/presentation/widgets/main_grid_widgets/main_alert_dialog_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/general_widgets/show_error_message_snack_bar.dart';
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
        title: Text(
          'Easacc Task',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 25),
        ),
      ),
      body: BlocProvider(
        create: (context) => ServicesBloc(),
        child: BlocConsumer<ServicesBloc, ServicesState>(
          listener: (context, state) {
            if (state.servicesRequestState == RequestState.error) {

              //handling error with show error message
              generalWidgetShowErrorMessage(context, state.errorLoginMessage);

            }
            if (state.servicesRequestState == RequestState.loaded) {
              switch (state.servicesOn) {

                //check every service to show dialog alert depend on the type of service
                case ServicesOn.camera:
                  Future.delayed(const Duration(milliseconds: 150), () async {
                    await showConnectSuccessAlertDialog(
                        context, 'Camera connected successfully');
                  });
                  break;
                case ServicesOn.usb:
                  Future.delayed(const Duration(milliseconds: 150), () async {
                    await showUsbAlertDialog(context, state.usbDevicesNum);
                  });
                  break;
                case ServicesOn.bluetooth:
                  Future.delayed(const Duration(milliseconds: 150), () async {
                    await showBluetoothAlertDialog(
                        context, state.isBluetoothOn);
                  });
                  break;
                case ServicesOn.printer:
                  Future.delayed(const Duration(milliseconds: 150), () async {
                    await showConnectSuccessAlertDialog(
                        context, 'Printer connected successfully');
                  });
                  break;
              }
            }
          },
          listenWhen: (previous, current) =>
              current.servicesRequestState != previous.servicesRequestState,
          buildWhen: (previous, current) =>
              current.servicesRequestState != previous.servicesRequestState,
          builder: (context, state) => Container(
              padding: const EdgeInsets.only(left: 14, right: 14),
              decoration: BoxDecoration(
                  gradient: RadialGradient(
                colors: [
                  Theme.of(context).primaryColor.withOpacity(0.4),
                  Colors.transparent
                ], radius: 0.8,
              )),
              width: double.infinity,
              height: double.infinity,
              child: const MainWidgetGrid()),
        ),
      ),
    );
  }
}
