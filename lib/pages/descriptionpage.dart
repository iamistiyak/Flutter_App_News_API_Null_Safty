import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Description extends StatefulWidget{
  final String? newsTitle;
  final String? newsDescription;
  final String? formatTime;
  final String? imageUrl;

  Description({Key? key,  this.newsDescription, this.formatTime, this.imageUrl, this.newsTitle}) : super(key: key);
  @override
  State<Description> createState() => _DescriptionState(newsDescription: newsDescription, newsTitle: newsTitle, formatTime: formatTime, imageUrl: imageUrl);
}

class _DescriptionState extends State<Description> {

  _DescriptionState({Key? key,  this.newsDescription, this.formatTime, this.imageUrl, this.newsTitle});
  String? newsTitle;
  final String? newsDescription;
  final String? formatTime;
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(newsTitle?? ""),
      ),
      body: Column(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            child: AspectRatio(
                aspectRatio: 1,
                child: Image.network(
                  imageUrl ??"",
                  fit: BoxFit.cover,
                )),
          ),
          const SizedBox(width: 16),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                // Text(formattedTime),
                Text(
                  newsTitle ?? "Title",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),

                Text(
                  newsDescription ?? "Description",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}