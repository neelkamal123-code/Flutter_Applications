import 'package:flutter/material.dart';
import 'package:Flutter_News_App/helper/news.dart';
import 'package:Flutter_News_App/models/article_model.dart';
import 'package:Flutter_News_App/tiles/blog.dart';

class CategoryNews extends StatefulWidget{
  final String category;
  CategoryNews({required this.category});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CategoryNewsState();
  }
}

class CategoryNewsState extends State<CategoryNews>{
  List<ArticleModel> articles = [];
  bool loading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCategoryNewsall();

  }


  void getCategoryNewsall() async {
    CategoryNewsClass newsClass = CategoryNewsClass();
    await newsClass.getNews(widget.category.toLowerCase());
    articles = newsClass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black, onPressed: () {
          Navigator.pop(context);
        },
        ),
        actions: [],
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Text(
              widget.category,
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
      Container(
        child: Column(
          children: [
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
      ),
    );
  }
}