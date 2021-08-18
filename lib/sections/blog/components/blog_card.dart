import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:web_app/models/Article.dart';
import 'package:web_app/sections/blog/components/favourite_button.dart';

import '../../../constants.dart';

class BlogCard extends StatefulWidget {
  const BlogCard({
    Key key,
    this.index,
  }) : super(key: key);

  final int index;

  @override
  _BlogCardState createState() => _BlogCardState();
}

class _BlogCardState extends State<BlogCard> {
  Duration duration = Duration(milliseconds: 200);
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      hoverColor: Colors.transparent,
      onHover: (value) {
        setState(() {
          isHover = value;
        });
      },
      child: AnimatedContainer(
        duration: duration,
        margin: EdgeInsets.only(top: kDefaultPadding * 3),
        padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
        height: 350,
        width: 350,
        decoration: BoxDecoration(
          color: Color(articles[widget.index].colorCode),
          borderRadius: BorderRadius.circular(10),
          boxShadow: [if (isHover) kDefaultCardShadow],
        ),
        child: Column(
          children: [
            Transform.translate(
              offset: Offset(0, -55),
              child: AnimatedContainer(
                duration: duration,
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 10),
                  boxShadow: [if (!isHover) kDefaultCardShadow],
                  image: DecorationImage(
                    image: AssetImage(articles[widget.index].userPic),
                  ),
                ),
              ),
            ),
            Text(
              articles[widget.index].body,
              style: TextStyle(
                color: kTextColor,
                fontSize: 18,
                fontWeight: FontWeight.w300,
                fontStyle: FontStyle.italic,
                height: 1.5,
              ),
            ),
            SizedBox(height: kDefaultPadding * 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Ronald Thompson",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                FavouriteButton()
              ],
            )
          ],
        ),
      ),
    );
  }
}
