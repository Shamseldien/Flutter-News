import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/modules/head_lines_screen/HeadLinesCubit/HeadLinesCubit.dart';
import 'package:news/modules/head_lines_screen/HeadLinesCubit/HeadLinesState.dart';
import 'package:news/modules/single_category/single_category.dart';
import 'package:news/shared/component/components.dart';

class HeadLinesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      HeadLinesCubit.get(context)..getHeadLines();
      return BlocConsumer<HeadLinesCubit, HeadLinesStates>(

        listener: (BuildContext context, state) {
          if (state is HeadLinesErrorState) {
            ScaffoldMessenger.of(context)
                .showSnackBar(
              SnackBar(
                content: Text(state.error,),
                backgroundColor: Colors.red,
              )
            );
          }
        },
        builder: (BuildContext context, state) {
          var cubit =HeadLinesCubit.get(context);
          var list = [];
          list = cubit.articles;
          return Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                  color: Colors.black
              ),
              elevation: 5,
              brightness: Brightness.light,
              backgroundColor: Colors.white,
              title: Row(
                children: [
                  Text(
                    'Daily',
                    style: GoogleFonts.lobster(
                        letterSpacing: 3,
                        color: Colors.black,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                  Text(
                    ' News',
                    style: GoogleFonts.lobster(
                        letterSpacing: 3,
                        color: Colors.blue,
                        fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
            backgroundColor: Colors.white,
            body:state is! HeadLinesErrorState ? ConditionalBuilder(
              condition: state is! HeadLinesLoadingState,
              builder: (ctx)=>ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20
                    ),
                    child: Text('Categories',
                      style: GoogleFonts.aclonica(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:15.0 ),
                    child: Container(
                      height: 130,
                      child: ListView.builder(
                        itemBuilder: (context, index) => allCategories(
                          context: context,
                          image: cubit.categoryImage[index],
                          title: cubit.categoryTitle[index]
                        ),
                        itemCount:cubit.categoryTitle.length,
                        scrollDirection: Axis.horizontal,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text('Top News',
                          style: GoogleFonts.aclonica(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: ListView.separated(
                          itemBuilder: (BuildContext context, int index)=> topNewsItems(list[index],context),
                          itemCount: list.length,
                          shrinkWrap: true,
                          separatorBuilder: (context,index)=>Container(),
                          physics: NeverScrollableScrollPhysics(),
                        ),
                      ),

                    ],
                  )

                ],

              ),
              fallback: (ctx)=>Center(child: CircularProgressIndicator(),),
            ):Center(child: Text('No Internet Connection'),),
          );
        },
      );
    });
  }


}
