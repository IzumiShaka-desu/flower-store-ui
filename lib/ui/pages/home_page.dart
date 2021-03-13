import 'package:flutter/material.dart';
import 'package:veluv/constant/constant.dart';
import 'package:veluv/ui/componets/category_section.dart';
import 'package:veluv/ui/componets/main_appbar.dart';
import 'package:veluv/ui/componets/search_bar.dart';
import 'package:veluv/ui/sections/home_content_section.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          alignment: Alignment.topCenter,
          image: AssetImage(
            Constants.assetImage('header.png'),
          ),
        ),
      ),
      child: Column(
        children: [
          MainAppBar(),
          SearchBar(),
          CategorySection(),
          Expanded(child: HomeContentSection()),
        ],
      ),
    );
  }
}
