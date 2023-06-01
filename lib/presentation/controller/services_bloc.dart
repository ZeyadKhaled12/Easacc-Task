import 'dart:async';

import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:usb_serial/usb_serial.dart';

import '../../core/utils/enums.dart';

part 'services_event.dart';

part 'services_state.dart';

class ServicesBloc extends Bloc<ServicesEvent, ServicesState> {
  ServicesBloc() : super(const ServicesState()) {
    on<CheckBluetoothEvent>(_checkBluetooth);
    on<CheckUsbEvent>(_checkUsb);
    on<CheckCameraEvent>(_checkCamera);
    on<CheckPrinterEvent>(_checkPrinter);
  }

  FutureOr<void> _checkBluetooth(
      CheckBluetoothEvent event, Emitter<ServicesState> emit) async {
    emit(state.copyWith(servicesRequestState: RequestState.loading));
    FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
    bool isOn = await flutterBlue.isOn;
    emit(state.copyWith(
        servicesRequestState: RequestState.loaded,
        isBluetoothOn: isOn,
        servicesOn: ServicesOn.bluetooth));
  }

  FutureOr<void> _checkUsb(
      CheckUsbEvent event, Emitter<ServicesState> emit) async {
    emit(state.copyWith(servicesRequestState: RequestState.loading));
    List<UsbDevice> devices = await UsbSerial.listDevices();
    emit(state.copyWith(
        servicesRequestState: RequestState.loaded,
        usbDevicesNum: devices.length,
        servicesOn: ServicesOn.usb));
  }

  FutureOr<void> _checkCamera(
      CheckCameraEvent event, Emitter<ServicesState> emit) async {
    emit(state.copyWith(servicesRequestState: RequestState.loading));
    await availableCameras().catchError((e) {
      emit(state.copyWith(
          servicesRequestState: RequestState.error,
          errorLoginMessage: 'Camera is not connected',
          servicesOn: ServicesOn.camera));
      throw e;
    });
    emit(state.copyWith(
        servicesRequestState: RequestState.loaded,
        servicesOn: ServicesOn.camera));
  }

  FutureOr<void> _checkPrinter(
      CheckPrinterEvent event, Emitter<ServicesState> emit) async {
    emit(state.copyWith(servicesRequestState: RequestState.loading));

    const PaperSize paper = PaperSize.mm80;
    final profile = await CapabilityProfile.load();
    final printer = NetworkPrinter(paper, profile);

    final PosPrintResult res =
        await printer.connect('192.168.0.123', port: 9100);

    if (res == PosPrintResult.success) {
      emit(state.copyWith(
          servicesRequestState: RequestState.loaded,
          servicesOn: ServicesOn.printer));
    } else {
      emit(state.copyWith(
          servicesRequestState: RequestState.error,
          errorLoginMessage: 'Printer is not connected',
          servicesOn: ServicesOn.printer));
    }
  }
}
