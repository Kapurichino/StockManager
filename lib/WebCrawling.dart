// import 'dart:convert';
// import "package:flutter/material.dart";
// import "package:http/http.dart";
// import "package:http_parser/http_parser.dart";
// import "package:html/parser.dart";
// import "package:html/dom.dart";
// import "package:html/dom_parsing.dart";




// class WebCrawling extends StatelessWidget {
//   WebCrawling({Key? key, this.keyword, this.selected}) : super(key: key);
//   final keyword;
//   final selected;
//   getVideoData() async {
//     var thumbnail;
//     var href = "";
//     var data;
//     await(get(Uri.parse("https://www.youtube.com/results?search_query=$keyword")))
//         .then((value) => data = value);
//     data = jsonDecode(data);
//     thumbnail = document.getElementById('thumbnail');
//     print(thumbnail);
//   }
//
//   getImgData() async {
//
//     var data;
//     await(get(Uri.parse("https://www.google.com/search?q=$keyword&tbm=isch&source=lnms&sa=X")))
//         .then((value) => data = value);
//     data = jsonDecode(data);
//   }
//
//   getArticleData() async {
//     var data;
//     await(get(Uri.parse("https://www.google.com/search?q=$keyword&source=lnms&tbm=nws")))
//         .then((value) => data = value);
//     data = jsonDecode(data);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return getVideoData();
//   }
// }
