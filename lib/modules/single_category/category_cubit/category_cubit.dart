import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news/modules/single_category/category_cubit/category_states.dart';
import 'package:news/shared/network/remote/helper.dart';

class CategoryCubit extends Cubit<CategoryStates>{
  CategoryCubit() : super(CategoryInitialState());

  static CategoryCubit get(context)=>BlocProvider.of(context);

  List category=[];

  getCategory(category){
    emit(CategoryLoadingState());
    DioHelper.getSingleCategory(
        path: 'v2/top-headlines',
        category: category)
        .then((value){
          this.category=value.data['articles'] as List;
          emit(CategorySuccessState());
    })
        .catchError((error){
          print(error.toString());
          emit(CategoryErrorState(error));
    });
  }

}