class ArticleModel{
 static Map articles ;
 static String getTitle ;
 static String getImage;
 static String getAuthor;
 static String getDate;
 static String getDesc;
 static String getContent;
 static String getUrl;

 ArticleModel(List data){
  articles=data.asMap();
 }

  static getTopHeadlines(article){
   getTitle =article ['title'] ;
   getDate = article['publishedAt'];
    getAuthor = article['source']['name'];
    getImage=article['urlToImage'];
    getDesc=article['description'];
    getContent=article['content'];
    getUrl=article['url'];
  }


}
