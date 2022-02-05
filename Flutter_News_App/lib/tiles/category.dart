
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:Flutter_News_App/views/category_news.dart';


class CategoryTile extends StatelessWidget {
  CategoryTile({this.imageUrl, this.categoryName});
  final categoryName;
  final imageUrl;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return CategoryNews(category: categoryName);
        }));
      },
      child: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(6.0)),
                // border: Border.all(
                //     //color: Colors.black,
                //     //width: 3,
                //     ),
              ),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 120,
                height: 60,
              ),
            ),
            Text(categoryName,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black87,
              letterSpacing: 2
            ),
            ),
          ],
        ),
      ),
    );
  }
}




