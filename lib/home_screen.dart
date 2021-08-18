import 'package:flutter/material.dart';
import 'package:web_app/body_section.dart';
import 'package:web_app/constants.dart';
import 'package:web_app/sections/about/about_section.dart';
import 'package:web_app/sections/blog/blog_section.dart';
import 'package:web_app/sections/contact/contact_section.dart';
import 'package:web_app/sections/recent_work/recent_work_section.dart';
import 'package:web_app/sections/skills/skills_section.dart';
import 'package:web_app/sections/topSection/top_section.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopSection(),
            // SizedBox(height: kDefaultPadding * 2),
            // BodySection()
            // AboutSection(),
            // SkillSection(),
            // RecentWorkSection(),
            // BlogSection(),
            // SizedBox(height: kDefaultPadding),
            // ContactSection(),
            // This SizeBox just for demo
            // SizedBox(
            //   height: 500,
            // )
          ],
        ),
      ),
    );
  }
}
