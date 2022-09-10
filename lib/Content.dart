import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

class Content extends StatelessWidget {
  const Content({Key? key, this.listKeyword, this.listOption, this.removeKeyword, this.externalIndex, this.title, this.link, this.thumb, this.images}) : super(key: key);
  final listKeyword;
  final listOption;
  final removeKeyword;
  final externalIndex;
  final title;
  final link;
  final thumb;
  final images;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        height: 300,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
            boxShadow : [
              BoxShadow(
                  spreadRadius: 2,
                  blurRadius: 1,
                  color: Color(0xD3CFCFFF)
              )
            ]
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("${listKeyword[externalIndex]}    - ${listOption[externalIndex]} -", style: TextStyle(
                    fontSize: 20
                  ),),
                  IconButton(
                      onPressed: (){
                        removeKeyword(listKeyword[externalIndex], listOption[externalIndex]);
                      },
                      icon: FaIcon(FontAwesomeIcons.trash)
                  )
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    if (listOption[externalIndex] == 'Article'){
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.network(thumb[index]),
                          TextButton(onPressed: (){
                            launchUrl(Uri.parse(link[index]));
                          }, child: Wrap(
                            direction: Axis.vertical,
                            children: [
                              Text(title[index])
                            ],
                          ))
                        ],
                      );
                    }
                    else if (listOption[externalIndex] == 'Img'){
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(images[index]),
                          ]
                        );
                    }
                    else if (listOption[externalIndex] == 'Video'){
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                          ]
                      );
                    }
                    else
                      return null;
                  },
                  autoplay: true,
                  itemCount: 10,
                  pagination: SwiperPagination(),
                  control: SwiperControl(),
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}