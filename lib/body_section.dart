import 'package:flutter/material.dart';
import 'package:web_app/sections/about/about_section.dart';
import 'package:web_app/sections/blog/blog_section.dart';
import 'package:web_app/sections/contact/contact_section.dart';
import 'package:web_app/sections/recent_work/recent_work_section.dart';
import 'package:web_app/sections/skills/skills_section.dart';
import 'package:web_app/sections/topSection/components/menu.dart';

// ignore: must_be_immutable
class BodySection extends StatefulWidget {
  BodySection({Key key, this.menuKey}) : super(key: key);
  String menuKey;
  @override
  _BodySectionState createState() => _BodySectionState(this.menuKey);
}

class _BodySectionState extends State<BodySection> {
  _BodySectionState(this.menuKey);
  String menuKey;
  final List<Widget> pageItems = [
    BlogSection(),
    AboutSection(),
    SkillSection(),
    // "Education":
    RecentWorkSection(),
    ContactSection(),
  ];

  @override
  Widget build(BuildContext context) {
    // return menuItems["$menuKey"];
    return Container(
      //height: 2000,
      constraints: BoxConstraints(maxHeight: 1500),
      padding: EdgeInsets.symmetric(horizontal: 100),
      child: PageView(
        //controller: PageController(initialPage: 0),
        scrollDirection: Axis.horizontal,
        children: List.generate(pageItems.length, (int) => pageItems[int]),
      ),
    );
  }
}
