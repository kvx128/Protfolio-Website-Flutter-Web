import 'package:flutter/material.dart';
import 'package:web_app/components/services/authentication.dart';
import 'package:web_app/components/my_outline_button.dart';
import 'package:web_app/sections/blog/components/blank_blog_card.dart';
import 'package:web_app/sections/blog/components/blog_card.dart';

import '../../../constants.dart';

class SignedInUserPage extends StatelessWidget {
  SignedInUserPage({
    Key key,
  }) : super(key: key);
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: 1110),
      margin: EdgeInsets.only(top: kDefaultPadding * 2),
      padding: EdgeInsets.all(kDefaultPadding * 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: kDefaultPadding * 8,
                width: kDefaultPadding * 8,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/people.png"),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding * 4),
                child: Column(
                  children: [
                    Text(
                      "@Ronald Thompson",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .copyWith(height: 1.5),
                    ),
                    SizedBox(
                      height: kDefaultPadding * 2,
                    ),
                    // Text("Articles Liked")
                    MyOutlineButton(
                      text: "Sign Out",
                      press: () async {
                        await _auth.signOut();
                      },
                      imageSrc: "assets/images/signout.png",
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding * 2),
            child: Divider(
              height: kDefaultPadding,
              color: Color(0xFFA600FF).withOpacity(0.25),
              thickness: kDefaultPadding * 0.5,
            ),
          ),
          SizedBox(
            height: kDefaultPadding * 2,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BlankBlogCard(),
              BlogCard(
                index: 0,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BlogCard(
                index: 1,
              ),
              BlogCard(
                index: 2,
              )
            ],
          ),

          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: List.generate(
          //     articles.length - 1,
          //     (index) => BlogCard(index: index),
          //   ),
          // ),
        ],
      ),
    );
  }
}
