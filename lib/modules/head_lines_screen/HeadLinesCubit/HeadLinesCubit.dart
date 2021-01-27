import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:news/models/ArticleModel.dart';
import 'package:news/modules/head_lines_screen/HeadLinesCubit/HeadLinesState.dart';
import 'package:news/shared/network/remote/helper.dart';

class HeadLinesCubit extends Cubit<HeadLinesStates> {
  HeadLinesCubit() : super(HeadLinesInitialState());
  static HeadLinesCubit get(context) => BlocProvider.of(context);

  List articles ;

  List categoryTitle=[
    'health',
    'science',
    'sports',
    'technology',
    'business',
    'entertainment',
  ];

  List categoryImage=[
    'https://images.unsplash.com/photo-1542736667-069246bdbc6d?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=751&q=80',
    'https://images.unsplash.com/photo-1609188076864-c35269136b09?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
    'https://images.unsplash.com/photo-1571254750851-f071d70b0690?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
    'https://images.unsplash.com/photo-1504384764586-bb4cdc1707b0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80',
    'https://images.unsplash.com/photo-1444653389962-8149286c578a?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=745&q=80',
    'https://cdn.pixabay.com/photo/2017/06/30/00/47/amusement-2456905_960_720.jpg',
  ];

  getNewDate(article){
    DateTime tempDate = new DateFormat("yyyy-MM-dd").parse(article['publishedAt']);
    String time =  DateFormat("yyyy-MM-dd").format(tempDate);
    return time;
  }

  getHeadLines() {
    emit(HeadLinesLoadingState());
    DioHelper.getHeadLines(
      path: 'v2/top-headlines',
    ).then((value) {
      articles = value.data['articles'] as List;
      emit(HeadLinesSuccessState());
    }).catchError((e) {
      emit(HeadLinesErrorState(e.message));
    });
  }
}
