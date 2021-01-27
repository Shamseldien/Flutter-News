import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/details_screen/bloc/details_cubit.dart';
import 'package:news/modules/head_lines_screen/HeadLinesCubit/HeadLinesCubit.dart';
import 'package:news/modules/head_lines_screen/headLinesScreen.dart';
import 'package:news/modules/healthy_screen/healthyCubit/healthy_cubit.dart';
import 'package:news/modules/single_category/category_cubit/category_cubit.dart';
import 'package:news/shared/network/remote/helper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DioHelper();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HeadLinesCubit()),
        BlocProvider(create: (context) => HealthyCubit()),
        BlocProvider(create: (context) => CategoryCubit()),
        BlocProvider(create: (context) => DetailsCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HeadLinesScreen(),
      ),
    );
  }
}
