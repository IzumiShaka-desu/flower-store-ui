import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:veluv/constant/color_pallete.dart';
import 'package:veluv/constant/constant.dart';
import 'package:veluv/constant/size.dart';
import 'package:veluv/model/flower.dart';
import 'package:veluv/utils/show_snackbar.dart';
import 'package:veluv/utils/star_list.dart';

class DetailScreen extends StatefulWidget {
  final Flower flower;
  final List<Flower> savedFlowers;
final String tags;
  const DetailScreen(
      {Key key, @required this.flower, @required this.savedFlowers, this.tags})
      : assert(savedFlowers != null),
        super(key: key);

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  PageController _controller;
  double _currentPageViewIndex = 0;
  int _count = 0;
  @override
  void initState() {
    _controller = PageController();
    _controller.addListener(() {
      setState(() {
        _currentPageViewIndex = _controller.page;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(widget.savedFlowers);
        return false;
      },
      child: Scaffold(
        backgroundColor: ColorPallete.backgroundColor.withAlpha(240),
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 7,
                            child: Container(
                              child: Hero(
                                tag: "${widget.flower.name} ${widget.tags}",
                                child: PageView.builder(
                                    controller: _controller,
                                    itemCount:
                                        widget.flower?.image?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      return Container(
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              widget.flower.image[index],
                                            ),
                                            alignment: Alignment.bottomCenter,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      );
                                    }),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(),
                          )
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          DotsIndicator(
                              decorator: DotsDecorator(
                                  activeColor: Colors.white,
                                  color: Colors.white60),
                              dotsCount: widget.flower.image.length,
                              position: _currentPageViewIndex),
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: Container(
                              height: 150,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 4,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                image: DecorationImage(
                                                  fit: BoxFit.cover,
                                                  image: AssetImage(
                                                      widget.flower.image.last),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 5,
                                          child: Container(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Row(
                                                  children: [
                                                    TextTitle(
                                                      text: widget.flower.name,
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    SvgPicture.asset(
                                                      Constants.assetIcon(
                                                          'location.svg'),
                                                    ),
                                                    SizedBox(width: 5),
                                                    Text(
                                                      widget.flower.origin ??
                                                          '',
                                                      style:
                                                          Constants.textTheme(
                                                                  context)
                                                              .bodyText1
                                                              .copyWith(
                                                                  color: Colors
                                                                      .grey),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 12,
                                                ),
                                                Row(
                                                  children: [
                                                    Container(
                                                      padding:
                                                          EdgeInsets.all(5),
                                                      height: 20,
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children:
                                                            createListStar(
                                                                widget.flower
                                                                    .rate),
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: ColorPallete
                                                            .primaryLightColor
                                                            .withOpacity(0.3),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              InkWell(
                                                child: Container(
                                                  width: 45,
                                                  height: 45,
                                                  decoration: BoxDecoration(
                                                    color: ColorPallete
                                                        .primaryLightColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10,
                                                    ),
                                                  ),
                                                  padding: EdgeInsets.all(10),
                                                  child: SvgPicture.asset(
                                                    Constants.assetIcon(
                                                        'love.svg'),
                                                    color: ColorPallete
                                                        .backgroundCardColor,
                                                  ),
                                                ),
                                                onTap: () {
                                                  bool _isAdded = false;
                                                  widget.savedFlowers
                                                      .forEach((element) {
                                                    _isAdded = element.name
                                                        .contains(
                                                            widget.flower.name);
                                                  });
                                                  if (_isAdded) {
                                                    widget.savedFlowers
                                                        .removeWhere(
                                                            (element) =>
                                                                element.name ==
                                                                widget.flower
                                                                    .name);
                                                    showSnackBar(context,
                                                        'this Flower has been removed from saved Flower');
                                                  } else {
                                                    widget.savedFlowers
                                                        .add(widget.flower);
                                                    showSnackBar(context,
                                                        'this Flower has been saved');
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          flex: 2,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: RoundedIconButton(
                                                    onPressed: () => setState(
                                                          () => _count--,
                                                        ),
                                                    assetSvg: 'minus.svg'),
                                              ),
                                              Tooltip(
                                                message:
                                                    'Total price is Rp. ${_count * widget.flower.price}',
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  child: Text(
                                                    '$_count',
                                                    style: Constants.textTheme(
                                                            context)
                                                        .subtitle1
                                                        .copyWith(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: ColorPallete
                                                              .primaryTextColor,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(5.0),
                                                child: RoundedIconButton(
                                                  assetSvg: 'plus.svg',
                                                  onPressed: () => setState(
                                                    () => _count++,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                  horizontal: 15.0,
                                                ),
                                                child: Text(
                                                  ' Rp. ${widget.flower.price}',
                                                  style: Constants.textTheme(
                                                          context)
                                                      .subtitle1
                                                      .copyWith(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: ColorPallete
                                                            .primaryTextColor,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                              width: SizeUtils.widthOnPercent(90, context),
                            ),
                            color: ColorPallete.backgroundCardColor,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: ColorPallete.backgroundCardColor,
                              ),
                              onPressed: () => Navigator.of(context)
                                  .pop(widget.savedFlowers),
                            ),
                            Row(
                              children: [
                                IconButton(
                                    icon: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: SvgPicture.asset(
                                        Constants.assetIcon('cart.svg'),
                                      ),
                                    ),
                                    onPressed: () {}),
                                PopupMenuButton<String>(
                                  icon: SvgPicture.asset(
                                    Constants.assetIcon(
                                      'toggle.svg',
                                    ),
                                  ),
                                  onSelected: (value) {
                                    debugPrint(value);
                                  },
                                  itemBuilder: (BuildContext context) {
                                    return {'Settings', 'Report'}
                                        .map((String choice) {
                                      return PopupMenuItem<String>(
                                        value: choice,
                                        child: Text(choice),
                                      );
                                    }).toList();
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          SizeUtils.widthOnPercent(5, context),
                          20,
                          SizeUtils.widthOnPercent(5, context),
                          0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              TextTitle(text: 'Information'),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                  width: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: ColorPallete.primaryTextColor,
                                  ),
                                  child: SvgPicture.asset(
                                    Constants.assetIcon(
                                      'ingfo.svg',
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              TextSubtitle(
                                text: 'Condition : ',
                              ),
                              Text(widget.flower.condition)
                            ],
                          ),
                          Row(
                            children: [
                              TextSubtitle(
                                text: 'Weight : ',
                              ),
                              Text(widget.flower.weight)
                            ],
                          ),
                          Row(
                            children: [
                              TextSubtitle(
                                text: 'Category : ',
                              ),
                              Text(widget.flower.category)
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.all(10),
                          ),
                          Row(
                            children: [TextTitle(text: 'Description')],
                          ),
                          Text(widget.flower.description),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 75,
          color: ColorPallete.backgroundColor,
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleButton(
                    icon: SvgPicture.asset(
                      Constants.assetIcon(
                        'chat.svg',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  CircleButton(
                    icon: SvgPicture.asset(
                      Constants.assetIcon(
                        'cart.svg',
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: SizeUtils.widthOnPercent(45, context),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: ColorPallete.primaryLightColor,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            color:
                                ColorPallete.primaryLightColor.withOpacity(0.6),
                            blurRadius: 15)
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextSubtitle(
                        text: 'Buy Now',
                        color: ColorPallete.backgroundColor,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final Widget icon;
  const CircleButton({
    Key key,
    @required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            Constants.assetImage(
              'bg-btn.png',
            ),
          ),
        ),
      ),
      child: Center(child: icon ?? SizedBox()),
    );
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({
    Key key,
    @required this.text,
  }) : super(key: key);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? '',
      style: Constants.textTheme(context).headline6.copyWith(
            color: ColorPallete.primaryTextColor,
            fontWeight: FontWeight.w600,
          ),
    );
  }
}

class TextSubtitle extends StatelessWidget {
  final String text;
  final Color color;
  const TextSubtitle({
    Key key,
    this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text ?? ' ',
      style: Constants.textTheme(context).subtitle1.copyWith(
            fontWeight: FontWeight.w600,
            color: color ?? ColorPallete.primaryTextColor,
          ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final String assetSvg;
  const RoundedIconButton({
    Key key,
    @required this.onPressed,
    @required this.assetSvg,
    this.color,
  })  : assert(assetSvg != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: 30,
        height: 30,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: color ?? Theme.of(context).primaryColor,
          ),
          shape: BoxShape.circle,
        ),
        child: SvgPicture.asset(
          Constants.assetIcon(assetSvg),
          color: color ?? Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
