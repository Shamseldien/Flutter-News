import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/modules/details_screen/DetailsScreen.dart';
import 'package:news/modules/head_lines_screen/HeadLinesCubit/HeadLinesCubit.dart';
import 'package:news/modules/single_category/single_category.dart';

Widget singleCategoryItem(articles, context) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          onTap: () {
            navigateTo(
                context: context,
                widget: DetailsScreen(
                  image: articles['urlToImage'],
                  url: articles['url'],
                  desc: articles['description'],
                  author: articles['source']['name'],
                ));
          },
          child: Column(
            children: [
              Container(
                width: double.infinity,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
                child: Image(
                  height: 150,
                  image: NetworkImage(articles['urlToImage'] ??
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlAjmEa39aHEHQEFlMN7zcht_JTq9KhF0G7Q&usqp=CAU'),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: Text(
                  articles['title'],
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                      fontWeight: FontWeight.w800),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Text(
                  articles['description'] ?? '',
                  textDirection: TextDirection.rtl,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(5.0)),
                      child: Text(
                        articles['source']['name'] ?? '',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Spacer(),
                    Container(
                      padding: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          color: Colors.blue),
                      child: Text(
                        HeadLinesCubit.get(context).getNewDate(articles)?? '',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                          fontSize: 15.0,
                          color: Colors.white,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.0,
              ),
            ],
          ),
        ),
      ),
    );

Widget topNewsItems(article, context) => Padding(
      padding: const EdgeInsets.all(5.0),
      child: GestureDetector(
        onTap: (){
          navigateTo(
              context: context,
              widget: DetailsScreen(
                image: article['urlToImage'],
                url: article['url'],
                desc: article['description'],
                author: article['source']['name'],
              ));
        },
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
          color: Colors.white,
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            width: MediaQuery.of(context).size.width * 2,
            child: Row(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.height / 5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: NetworkImage(article['urlToImage'] ??
                              'https://image.shutterstock.com/image-photo/bright-spring-view-cameo-island-260nw-1048185397.jpg'),
                          fit: BoxFit.cover)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            article['title'] ?? '',
                            maxLines: 4,
                            textDirection: TextDirection.rtl,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16.0),
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              width: 80,
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Text(
                                article['source']['name'] ?? '',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Text(
                               HeadLinesCubit.get(context).getNewDate(article) ??
                                    '',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

navigateTo({context, widget}) => Navigator.push(
    context, MaterialPageRoute(builder: (BuildContext context) => widget));

Widget allCategories({context, image, title}) => InkWell(
      onTap: () {
        navigateTo(context: context, widget: SingleCategory(title));
        print(title);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(image)),
                  borderRadius: BorderRadius.circular(10.0)),
            ),
            SizedBox(
              height: 5.0,
            ),
            Text(
              title,
              style: GoogleFonts.aBeeZee(
                  fontWeight: FontWeight.bold, letterSpacing: 2),
            )
          ],
        ),
      ),
    );
