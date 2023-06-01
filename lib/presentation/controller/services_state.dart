part of 'services_bloc.dart';

class ServicesState extends Equatable {

  //boolean check if bluetooth on
  final bool isBluetoothOn;

  //value check how much devices connect to usb
  final int usbDevicesNum;

  //know which service user choose
  final ServicesOn servicesOn;

  final RequestState servicesRequestState;
  final String errorLoginMessage;

  const ServicesState(
      {this.isBluetoothOn = false,
      this.usbDevicesNum = 0,
      this.servicesOn = ServicesOn.bluetooth,
      this.servicesRequestState = RequestState.loaded,
      this.errorLoginMessage = ''});

  ServicesState copyWith(
      {bool? isBluetoothOn,
      ServicesOn? servicesOn,
      int? usbDevicesNum,
      RequestState? servicesRequestState,
      String? errorLoginMessage}) {
    return ServicesState(
      isBluetoothOn: isBluetoothOn ?? this.isBluetoothOn,
      servicesOn: servicesOn ?? this.servicesOn,
      usbDevicesNum: usbDevicesNum ?? this.usbDevicesNum,
      servicesRequestState: servicesRequestState ?? this.servicesRequestState,
      errorLoginMessage: errorLoginMessage ?? this.errorLoginMessage,
    );
  }

  @override
  List<Object> get props => [
        isBluetoothOn,
        servicesOn,
        usbDevicesNum,
        servicesRequestState,
        errorLoginMessage
      ];
}
