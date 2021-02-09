import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:news/modules/details_screen/DetailsScreen.dart';
import 'package:news/modules/single_category/category_cubit/category_cubit.dart';
import 'package:news/modules/single_category/category_cubit/category_states.dart';
import 'package:news/shared/component/components.dart';

class SingleCategory extends StatelessWidget {
  String title;
  SingleCategory(this.title);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.white,
      )
    );
    return  Builder(
      builder: (BuildContext context) {
        CategoryCubit.get(context)..getCategory(title);
        return BlocConsumer<CategoryCubit,CategoryStates>(
          listener: (context,state){
          },
          builder: (context,state){
            List articles = [];
            var cubit = CategoryCubit.get(context);
            articles = cubit.category;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                iconTheme: IconThemeData(color: Colors.black),
                backgroundColor: Colors.white,
                brightness: Brightness.light,
                title: Text(
                  title,
                  style: GoogleFonts.lobster(
                      letterSpacing: 3,
                      color: Colors.black,
                      fontWeight: FontWeight.w500
                  ),
                ),
              ),
              body: ConditionalBuilder(
                condition: state is! CategoryLoadingState,
                builder: (ctx)=> SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.separated(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: articles.length,
                        itemBuilder: (BuildContext context, int index)=>singleCategoryItem(articles[index],context),
                        separatorBuilder: (context,index)=>Container(),
                      ),
                    state is! CategoryGetMoreState
                     ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: GestureDetector(
                            onTap: (){
                              if(cubit.status!='error')
                                cubit.getMoreCategory(title);
                            },
                            child: state is! CategoryErrorState
                            ?Text('Load more...',style: GoogleFonts.aBeeZee(fontSize: 16,fontWeight: FontWeight.bold,letterSpacing: 2),)
                                :Container())),
                  )
                      : SpinKitThreeBounce(color: Colors.blue, size: 30.0,),
                    ],
                  ),
                ),
                fallback: (ctx)=>Center(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircularProgressIndicator(),
                ),),
              )
            );
          },
        );
      },);
  }
}
