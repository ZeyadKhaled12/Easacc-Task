import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

Future showBluetoothAlertDialog(BuildContext context, bool isOn) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Bluetooth',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
              Icon(isOn ? Icons.check : Icons.close,
                  size: 29,
                  color: isOn
                      ? Theme.of(context).secondaryHeaderColor
                      : Colors.red)
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  isOn
                      ? 'your bluetooth is on\n do you want turn of'
                      : 'your bluetooth is off\n do you want turn on',
                  style: const TextStyle(color: Colors.black, fontSize: 18)),
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () async {
                        FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
                        if (isOn) {
                          await flutterBlue.turnOff();
                        } else {
                          await flutterBlue.turnOn();
                        }
                        if (context.mounted) {
                          Navigator.of(context).pop();
                        }
                      },
                      child: const Text(
                        'Yes',
                        style: TextStyle(color: Colors.green, fontSize: 22),
                      )),
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'No',
                        style: TextStyle(color: Colors.red, fontSize: 22),
                      ))
                ],
              )
            ],
          ),
        );
      });
}

Future showConnectSuccessAlertDialog(BuildContext context, String text) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(text,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Theme.of(context).secondaryHeaderColor,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.white,
                    child: Center(
                      child: Icon(Icons.check,
                          size: 25,
                          color: Theme.of(context).secondaryHeaderColor),
                    ),
                  ),
                )
              ],
            ));
      });
}

Future showUsbAlertDialog(BuildContext context, int devicesNum) async {
  await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            'USB',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          content: Wrap(
            children: [
              const Text(
                'There are ',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
              Text(
                '$devicesNum devices ',
                style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 18),
              ),
              const Text(
                'Connect to your device ',
                style: TextStyle(color: Colors.black, fontSize: 15),
              ),
            ],
          ),
        );
      });
}
