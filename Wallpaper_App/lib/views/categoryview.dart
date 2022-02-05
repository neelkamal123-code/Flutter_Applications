import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:wallpaper_app/data/data.dart';
import 'package:wallpaper_app/views/fullscreen.dart';
import 'package:http/http.dart' as http;


class CategoryView extends StatefulWidget {

  String categoryName;
  CategoryView({required this.categoryName});

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  final newController = ScrollController();
  bool showSpinner = true;

  bool lower = false;
  var images = [];
  int pageNo = 1;


  getWallpapers(String url) async {
    var response = await http.get(
        Uri.parse(url),
        headers: {"Authorization": ApiKey});
    Map result = jsonDecode(response.body);
    setState(() {
      images = result["photos"];
      showSpinner = false;
    });
  }

  loadMore(String url) async {
    setState(() {
      pageNo = pageNo + 1;
    });
    String newurl = url+"&page=" +
        pageNo.toString();
    var response =
    await http.get(Uri.parse(newurl), headers: {"Authorization": ApiKey});
    Map result = jsonDecode(response.body);
    images.addAll(result["photos"]);


  }

  @override
  void initState() {

    // TODO: implement initState
    super.initState();

    getWallpapers("https://api.pexels.com/v1/search?query="+widget.categoryName.toLowerCase()+"&per_page=80");

    newController.addListener(() {
      if (newController.position.atEdge) {
        if (newController.position.pixels == 0) {
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text(widget.categoryName),
        centerTitle: true,
      ),
      body:  ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          children: [
            Container(
              child: Expanded(
                child: GridView.builder(
                  controller: newController,
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
            (lower)
                ? GestureDetector(
                onTap: () async {
                  await loadMore("https://api.pexels.com/v1/search?query="+widget.categoryName.toLowerCase()+"&per_page=80");

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
      ),
    );
  }
}


