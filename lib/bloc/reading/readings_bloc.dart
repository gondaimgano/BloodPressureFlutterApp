import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bpapp/db/dbase.dart';
part 'readings_state.dart';


class ReadingsBloc extends Cubit<ReadingsState> {
  List<BloodPressureReading> _records;
  final MyDatabase _database;

  ReadingsBloc(this._database) : super(ReadingsLoading());

  void fetchRecordList() async {
    try {
      emit(ReadingsLoading());
      _records = await _database.allReadingEntries;
      if (_records != null)
        _records.length > 0
            ? emit(ReadingsSuccess(_records))
            : throw _NoRecords();
      else
        throw _SomethingWentWrong();
    } catch (ex) {
      emit(ReadingsError(ex.toString()));
    }
  }


  void addRecord(BloodPressureReading bloodPressureReading) async {
    //emit(BpListLoading());
    try {
      emit(ReadingsLoading());
      await _database.insertReading(bloodPressureReading);

      _records = await _database.allReadingEntries;
      if (_records != null) {
        emit(ReadingsSuccess(_records));
      } else
        emit(ReadingsError("No response from database"));
    } catch (ex) {
      emit(ReadingsError(ex.toString()));
    }
  }

  void deleteRecord(BloodPressureReading bloodPressureReading) async {
    //emit(BpListLoading());
    try {
      emit(ReadingsLoading());
      await _database.deleteReading(bloodPressureReading);
      _records = await _database.allReadingEntries;

      if (_records != null)
        emit(ReadingsSuccess(_records));
      else
        emit(ReadingsError("No response from database"));
    } catch (ex) {
      emit(ReadingsError(ex.toString()));
    }
  }
}


class _NoRecords  implements Exception{

  @override
  String toString() {
    return "Please add a reading";
  }
}

class _SomethingWentWrong  implements Exception{

  @override
  String toString() {
    return "Something went wrong :(";
  }
}