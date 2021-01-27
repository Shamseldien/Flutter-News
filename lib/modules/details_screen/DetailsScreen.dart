import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/models/ArticleModel.dart';
import 'package:news/modules/details_screen/bloc/details_cubit.dart';
import 'package:news/modules/details_screen/bloc/details_states.dart';
import 'package:webview_flutter/webview_flutter.dart';
class DetailsScreen extends StatelessWidget{
  String author,desc,url,image;
  DetailsScreen({this.author,this.desc,this.image,this.url});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailsCubit,DetailsStates>(
         listener: (context,state){},
         builder: (context,state){
           return Scaffold(
               backgroundColor: Colors.white,
          /*     appBar: AppBar(
                 title: Text(author??'author',
                     style: GoogleFonts.audiowide(
                         color: Colors.black,
                         fontSize: 16
                     )),
                 iconTheme: IconThemeData(
                     color: Colors.black
                 ),
                 backgroundColor: Colors.white,
               ),*/
               body: Stack(
                 alignment: Alignment.center,
                 children: [
                   WebView(
                     javascriptMode: JavascriptMode.unrestricted,
                     initialUrl: url,
                    debuggingEnabled: true,
                    onPageFinished: (finish){
                       DetailsCubit.get(context).loadingState(isLoading: false);
                    },

                   ),
                   DetailsCubit.get(context).isLoading
                       ?CircularProgressIndicator()
                   :Stack(),
                 ],
               )
           );
         },
    );
  }


  customScrollView()=>CustomScrollView(
    slivers: [
      SliverAppBar(
        expandedHeight: 300,
        pinned: true,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(author??'author'),
          background: Image.network(image??'https://images.ctfassets.net/hrltx12pl8hq/6gefxWFu1cp4cECQE6qpRS/15f4228cb3a2265c990dbaf1304ecea2/shutterstock_1469674187.jpg?fit=fill&w=800&h=400',fit: BoxFit.cover,),
        ),
      ),
      SliverFillRemaining(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(desc??'desc',
                style:TextStyle(fontSize: 18),
                textDirection: TextDirection.rtl,),
            ),
            SizedBox(height: 5.0,),
            Expanded(
              child: WebView(
                initialUrl: url,
                debuggingEnabled:  true,
                javascriptMode: JavascriptMode.unrestricted,
              ),
            )

          ],
        ),
      )
    ],

  );
}
