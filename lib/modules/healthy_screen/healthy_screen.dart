import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/healthy_screen/healthyCubit/healthy_cubit.dart';
import 'package:news/modules/healthy_screen/healthyCubit/healthy_states.dart';

class HealthyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HealthyCubit,HealthyState>(
      builder: (context,state){
        return Scaffold(body: Container(color: Colors.blueGrey,));
      },
      listener: (context,state){},
    );
  }
}
