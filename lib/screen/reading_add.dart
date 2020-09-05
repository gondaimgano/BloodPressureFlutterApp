import 'package:bpapp/bloc/reading/readings_bloc.dart';
import 'package:bpapp/db/dbase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gondaiuipackage/gondaiuipackage.dart';




class ReadingAddPage extends StatefulWidget {
  @override
  _ReadingAddPageState createState() => _ReadingAddPageState();
}

class _ReadingAddPageState extends State<ReadingAddPage> {
  TextEditingController _upperController=TextEditingController();

  TextEditingController _lowerController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocConsumer<ReadingsBloc,ReadingsState>(
        builder: (context,state)=>_buildBody(state, context),
        listener: _listener,
      ),
    );
  }

  _buildBody(ReadingsState state,BuildContext context) {
    return [
      "Add Reading Entry".text().fontSize(19).bold(context),
      SizedBox(height: 12,),
      "Upper".popUpNumberField(context, _upperController),
      SizedBox(height: 12,),
      "Lower".popUpNumberField(context, _lowerController),
      SizedBox(height: 12,),
      "Save".raisedButton(() async{
        context.bloc<ReadingsBloc>().addRecord(
         BloodPressureReading(
           id: null,
           upper: int.tryParse(_upperController.text),
           lower: int.tryParse(_lowerController.text),
           createdDate: DateTime.now()
         )
        );
      })
    ].inColumn(mainAxisSize: MainAxisSize.min).addPadding(8.0).addCenter();
  }

  void _listener(BuildContext context, ReadingsState state) {
    if(state is ReadingsSuccess)
      {
        //context.bloc<ReadingsBloc>().fetchRecordList();
        Navigator.of(context).pop();

      }
    if(state is ReadingsError)
      Scaffold.of(context)..showSnackBar(SnackBar(
        content: state.message.text(),
      ));
  }
}
