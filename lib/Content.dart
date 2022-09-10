import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Content extends StatelessWidget {
  const Content({Key? key, this.listKeyword, this.listOption, this.removeKeyword, this.index, this.title, this.link, this.thumb}) : super(key: key);
  final listKeyword;
  final listOption;
  final removeKeyword;
  final index;
  final title;
  final link;
  final thumb;


  @override
  Widget build(BuildContext context) {
    print(listKeyword);
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Container(
        height: 200,
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
                  Text("${listKeyword[index]}    - ${listOption[index]} -", style: TextStyle(
                    fontSize: 20
                  ),),
                  IconButton(
                      onPressed: (){
                        removeKeyword(listKeyword[index], listOption[index]);
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
                    return Image.network(thumb[index]);
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