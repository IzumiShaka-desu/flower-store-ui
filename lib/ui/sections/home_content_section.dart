import 'package:flutter/material.dart';
import 'package:veluv/constant/color_pallete.dart';
import 'package:veluv/constant/constant.dart';
import 'package:veluv/constant/dummies.dart';
import 'package:veluv/constant/size.dart';
import 'package:veluv/model/flower.dart';
import 'package:veluv/ui/pages/flower_list_page.dart';
import 'package:veluv/ui/pages/saved_flower_list_page.dart';
import 'package:veluv/ui/screen/detail_screen.dart';
import 'package:veluv/utils/navigation.dart';

class HomeContentSection extends StatefulWidget {
  @override
  _HomeContentSectionState createState() => _HomeContentSectionState();
}

class _HomeContentSectionState extends State<HomeContentSection>
    with TickerProviderStateMixin {
  List<Flower> _flowers = Dummies.flowerDumies;
  List<Flower> _flowersNew = Dummies.flowerDumies;
  List<Flower> _savedFlower = [];
  TabController _controller;
  @override
  void initState() {
    _controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            width: SizeUtils.widthOnPercent(95, context),
            margin: EdgeInsets.only(top: 10),
            height: 60,
            child: Card(
              elevation: 0.8,
              borderOnForeground: false,
              shape: RoundedRectangleBorder(
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TabBar(
                  indicatorSize: TabBarIndicatorSize.label,
                  controller: _controller,
                  labelColor: ColorPallete.primaryTextColor,
                  labelStyle: Constants.textTheme(context)
                      .subtitle1
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: Constants.textTheme(context)
                      .subtitle2
                      .copyWith(fontWeight: FontWeight.w500),
                  labelPadding: EdgeInsets.zero,
                  tabs: [
                    Tab(
                      text: 'Popular',
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 2,
                          height: 30,
                          child: Container(
                            color: Colors.grey[350],
                          ),
                        ),
                        Expanded(
                          child: Tab(text: 'Newest'),
                        ),
                        SizedBox(
                          width: 2,
                          height: 30,
                          child: Container(
                            color: Colors.grey[350],
                          ),
                        ),
                      ],
                    ),
                    Tab(text: 'Saved'),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                FlowerListPage(
                  flowers: _flowers,
                  tags: 'pop',
                  onPressed: (Flower flower) async {
                    List<Flower> _newSaved = await Navigation.goTo(
                      context,
                      DetailScreen(
                        tags: 'pop',
                        flower: flower,
                        savedFlowers: _savedFlower ?? [],
                      ),
                    );
                    setState(() {
                      _savedFlower.setAll(0, _newSaved);
                    });
                  },
                ),
                FlowerListPage(
                  tags: 'new',
                  flowers: _flowersNew,
                  onPressed: (Flower flower) async {
                    List<Flower> _newSaved = await Navigation.goTo(
                      context,
                      DetailScreen(
                        tags: 'new',
                        flower: flower,
                        savedFlowers: _savedFlower ?? [],
                      ),
                    );
                    setState(() {
                      _savedFlower.setAll(0, _newSaved);
                    });
                  },
                ),
                SavedFlowerListpage(
                  tags: 'saved',
                  flowers: _savedFlower,
                  onPressed: (Flower flower) async {
                    List<Flower> _newSaved = await Navigation.goTo(
                      context,
                      DetailScreen(
                        tags: 'saved',
                        flower: flower,
                        savedFlowers: _savedFlower ?? [],
                      ),
                    );
                    setState(() {
                      _savedFlower.setAll(0, _newSaved);
                    });
                  },
                ),
              ],
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }
}
