import 'dart:io' show Platform;
import 'dart:typed_data';

import 'package:permission_handler/permission_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class FullScreen extends StatefulWidget {
  final String imageUrl;
  const FullScreen({required this.imageUrl});

  @override
  _FullScreenState createState() => _FullScreenState();
}

class _FullScreenState extends State<FullScreen> {
  //Save images to gallery
  save() async {
    if (Platform.isAndroid) {
      await askPermission();
    }

    var response = await Dio().get(widget.imageUrl,
        options: Options(responseType: ResponseType.bytes));
    final result =
        await ImageGallerySaver.saveImage(Uint8List.fromList(response.data));
    Navigator.pop(context);
  }

  //asking permissions
  askPermission() async {
    if (Platform.isIOS) {
      Map<Permission, PermissionStatus> permissions =
          await [Permission.photos].request();
    } else {
      //PermissionStatus permission = await Permission.storage.status;
      Map<Permission,PermissionStatus> permissions = await [Permission.storage].request();
    }
  }

  var size, height, width; //to handle media query
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          //image container
          Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
            height: height,
            width: width,
          ),

          //the other container
          Container(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // container of "set wallpaper" and "image will be save.."
                GestureDetector(
                  onTap: () {
                    setState(() {
                      save();
                    });
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    width: width / 2,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white54, width: 1),
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0x36FFFFFF),
                          const Color(0x0FFFFFFF),
                          const Color(0xff1C1B1B).withOpacity(0.8)
                        ],
                      ),
                    ),
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,

                      children: const [
                        Text(
                          "Set Wallpaper",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Image will be saved in gallery",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 15,
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
