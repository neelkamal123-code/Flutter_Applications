import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/models/categories_model.dart';
import 'package:wallpaper_app/views/categoryview.dart';
import 'package:wallpaper_app/views/fullscreen.dart';
import 'package:wallpaper_app/widget/widget.dart';
import 'package:http/http.dart' as http;


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool showSpinner = false;
  late String searchQuery = "";
  bool lower = false;
  List images = [];
  int pageNo = 1;
  final _controller = ScrollController();
  String defaultUrl = "https://api.pexels.com/v1/curated?per_page=80";
  List<CategoriesModel> categories = [];

  getWallpapers(String url) async {
    var response =
        await http.get(Uri.parse(url), headers: {"Authorization": ApiKey});
    Map result = jsonDecode(response.body);
    setState(() {
      images = result["photos"];
    });
  }

  loadMore(String url) async {
    setState(() {
      pageNo = pageNo + 1;
    });
    String newurl = url + "&page=" + pageNo.toString();
    var response =
        await http.get(Uri.parse(newurl), headers: {"Authorization": ApiKey});
    Map result = jsonDecode(response.body);
    images.addAll(result["photos"]);
  }

  @override
  void initState() {
    super.initState();

    getWallpapers(defaultUrl);
    //happens when   we click load more button
    //loadMore(defaultUrl);
    //for displaying categories
    categories = getCategories();
    //to check whether we are top scroll or down scroll
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {
          // You're at the top.
          setState(() {
            lower = false;
          });
        } else {
          // You're at the bottom.
          setState(() {
            lower = true;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: brandName(),
      ),
      body: Column(
        children: [
          //for search bar textfield+search icon wrapped in a container
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            decoration: BoxDecoration(
              color: const Color(0xfff5f8fd),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                      });
                    },
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: "search wallpaper",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryView(
                          categoryName: searchQuery.toLowerCase(),
                        ),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          //Categories tile container
          Container(
            height: 80,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 5),
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryView(
                            categoryName: categories[index].categoryName),
                      ),
                    );
                  },
                  child: CategoriesTile(
                      imgUrl: categories[index].imgUrl,
                      title: categories[index].categoryName),
                );
              },
            ),
          ),
          //for displaying images in grids form
          Expanded(
            child: Container(
              child: GridView.builder(
                controller: _controller,
                itemCount: images.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 2,
                  childAspectRatio: 2 / 3,
                  mainAxisSpacing: 2,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FullScreen(
                                    imageUrl: images[index]['src']['large2x'],
                                  )));
                    },
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          images[index]['src']['tiny'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          // displaying load more when scroll is at last
          (lower)
              ? GestureDetector(
                  onTap: () async {
                    await loadMore(defaultUrl);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50)),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 50,
                    ),
                  ))
              : Container(),
        ],
      ),
    );
  }
}



  class CategoriesTile extends StatelessWidget {
    late final String imgUrl, title;
    CategoriesTile({required this.imgUrl, required this.title});
    @override
    Widget build(BuildContext context) {
      return Container(
        margin: const EdgeInsets.only(right: 4),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imgUrl,
                height: 50,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 50,
              width: 100,
              //color: Colors.blue,
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      );
    }
  }
