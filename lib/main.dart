import 'package:bpapp/bloc/reading/readings_bloc.dart';
import 'package:bpapp/db/dbase.dart';
import 'package:bpapp/screen/reading_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  final MyDatabase database=MyDatabase();
  runApp(BPRoot(database));
}



class BPRoot extends StatelessWidget {
  final MyDatabase _database;
 BPRoot(this._database);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
       BlocProvider<ReadingsBloc>(
         create: (context)=>ReadingsBloc(_database)..fetchRecordList(),
       )
      ],
      child: MyApp(_database),
    );
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final MyDatabase _database;
  MyApp(this._database);
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider<ReadingsBloc>(
          create: (context)=>ReadingsBloc(_database)..fetchRecordList(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(

          primarySwatch: Colors.blue,

          visualDensity: VisualDensity.adaptivePlatformDensity,
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
              TargetPlatform.android: ZoomPageTransitionsBuilder()
            },
          ),
        ),
        home: ReadingListPage(),
      ),
    );
  }
}


