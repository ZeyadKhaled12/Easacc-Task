part of 'services_bloc.dart';

abstract class ServicesEvent extends Equatable {
  const ServicesEvent();

  @override
  List<Object> get props => [];
}


class CheckCameraEvent extends ServicesEvent {
  const CheckCameraEvent();
  @override
  List<Object> get props => [];
}

class CheckPrinterEvent extends ServicesEvent{
  const CheckPrinterEvent();
  @override
  List<Object> get props => [];
}


class CheckBluetoothEvent extends ServicesEvent {
  const CheckBluetoothEvent();
  @override
  List<Object> get props => [];
}

class CheckUsbEvent extends ServicesEvent {
  const CheckUsbEvent();
  @override
  List<Object> get props => [];
}
