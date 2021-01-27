import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/details_screen/bloc/details_states.dart';
import 'package:news/modules/single_category/category_cubit/category_states.dart';
import 'package:news/shared/network/remote/helper.dart';

class DetailsCubit extends Cubit<DetailsStates>{
  DetailsCubit() : super(DetailsInitialState());

  static DetailsCubit get(context)=>BlocProvider.of(context);

  bool isLoading=true;


  loadingState({bool isLoading}){
    this.isLoading=isLoading;
    emit(DetailsSuccessState());
  }


}