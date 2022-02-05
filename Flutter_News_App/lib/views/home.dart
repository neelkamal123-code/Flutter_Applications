import 'package:flutter/material.dart';
import 'package:Flutter_News_App/helper/data.dart';
import 'package:Flutter_News_App/helper/news.dart';
import 'package:Flutter_News_App/models/article_model.dart';
import 'package:Flutter_News_App/models/category_models.dart';
import 'package:Flutter_News_App/tiles/blog.dart';
import 'package:Flutter_News_App/tiles/category.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategory();
    getNewsall();
  }

  void getNewsall() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            //Appbar heading
            Text(
              "News",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            Text(
              "Pedia",
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),

      body: loading?Container(
        child: Center(child: CircularProgressIndicator()),
      ):
      Column(
        children: [

          //1st item of column
          //categories
          Expanded(
            flex: 1,
            child: ListView.builder(
              //shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CategoryTile(
                    imageUrl: categories[index].imageUrl,
                    categoryName: categories[index].categoriName,
                  ),
                );
              },
            ),
          ),


          //2nd item of column
          //Blogs
          Expanded(
            flex: 5,
            child: ListView.builder(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.vertical,
              //shrinkWrap: true,
              itemCount: articles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: BlogTile(
                    imageurl: articles[index].urlToImage,
                    title: articles[index].title,
                    desc: articles[index].description,
                    url: articles[index].url,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
