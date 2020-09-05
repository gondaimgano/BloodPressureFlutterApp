import 'dart:ui';

import 'package:bpapp/bloc/reading/readings_bloc.dart';
import 'package:bpapp/screen/reading_add.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gondaiuipackage/gondaiuipackage.dart';

class ReadingListPage extends StatefulWidget {
  @override
  _ReadingListPageState createState() => _ReadingListPageState();
}

class _ReadingListPageState extends State<ReadingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: "Fungie".text(),
       centerTitle: true,
     ),
      body: SafeArea(
        child:
          BlocConsumer<ReadingsBloc, ReadingsState>(
            builder: (context, state) => _buildBody(state),
            listener: _listener,
          ),

      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.navigateTo(ReadingAddPage(), back: true);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  _buildBody(ReadingsState state) {
    if (state is ReadingsLoading)
      return CircularProgressIndicator().addCenter();
    if (state is ReadingsError)
      return [
        state.message.text(),
        SizedBox(
          height: 12,
        ),
        "Try again".raisedButton(() {
          context.bloc<ReadingsBloc>().fetchRecordList();
        }),
      ].inColumn(mainAxisSize: MainAxisSize.min).addCenter();
    if (state is ReadingsSuccess)
      return [
        if(state.records.length>=10)
       ...[ ListTile(
          title: "BP Readings".text(),
          subtitle: "Your last 3 recent readings".text(),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

           ... state.records.getRange(0, 3).toList().map((item) => Text(
             "${item.upper}/${item.lower}",
             style: TextStyle(fontSize: 30, fontFeatures: [
               FontFeature.enable('frac'),
             ]),

           )),

          ],
        ).addPadding(8.0),],
        if(state.records.length<=9)
          Text(
            "${state.records.first.upper}/${state.records.first.lower}",
            style: TextStyle(fontSize: 30, fontFeatures: [
              FontFeature.enable('frac'),
            ]),

          ),
        Expanded(
            child: state.records.custom((item) => ListTile(
                  title: Text(
                    "${item.upper}/${item.lower}",
                    style: TextStyle(fontSize: 18, fontFeatures: [
                      FontFeature.enable('frac'),
                    ]),
                  ),
                  subtitle: item.createdDate.toString().text(),
                )))
      ].inColumn(mainAxisSize: MainAxisSize.min);
  }

  void _listener(BuildContext context, ReadingsState state) {}
}
