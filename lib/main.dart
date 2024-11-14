import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/application/view/home.dart';
import 'package:todo/data/datasource/postremortdatasource.dart';
import 'package:todo/domain/bloc/todo_bloc.dart';
import 'package:todo/domain/delete/bloc/delete_bloc.dart';
import 'package:todo/domain/edit/bloc/edit_bloc.dart';
import 'package:todo/domain/post/bloc/post_bloc.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => EditBloc(HomeRepo())),
        BlocProvider(create: (context) => TodoBloc()),
        BlocProvider(create: (context) => PostBloc(HomeRepo())),
        BlocProvider(create: (context) => DeleteBloc(HomeRepo()))
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
