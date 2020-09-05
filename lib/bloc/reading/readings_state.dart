part of 'readings_bloc.dart';

abstract class ReadingsState extends Equatable {
  @override
  List<Object> get props => [];
}

class ReadingsLoading extends ReadingsState {}

class ReadingsSuccess extends ReadingsState {
  final List<BloodPressureReading> records;

  ReadingsSuccess([this.records]);
}

class ReadingsError extends ReadingsState {
  final String message;

  ReadingsError(this.message);
}