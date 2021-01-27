import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/healthy_screen/healthyCubit/healthy_states.dart';

class HealthyCubit extends Cubit<HealthyState>{
  HealthyCubit() : super(HealthyInitialState());

  static HealthyCubit get(context)=>BlocProvider.of(context);


}