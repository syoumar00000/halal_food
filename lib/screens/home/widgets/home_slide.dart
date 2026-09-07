import 'package:flutter/material.dart';
import 'package:h_food/models/ads_model.dart';
import 'package:h_food/styles/button/default_button.dart';
import 'package:h_food/widgets/indicator/slide_indicator.dart';

class HomeSlide extends StatefulWidget {
  //final List<PromotionModel> items;
  final List<AdsModel> adsItems;
  const HomeSlide({super.key, required this.adsItems});

  @override
  State<HomeSlide> createState() => _HomeSlideState();
}

class _HomeSlideState extends State<HomeSlide> {
  int _slideIndex = 0;
  final PageController _pageController = PageController(initialPage: 0);
  final List<AdsModel> _onslideData = [
    AdsModel(
      id: 0,
      title: "Buy 1 Pizza,get 1 Free!",
      description: "Double the Pizza, double the fun -limited time only!.",
      image: "assets/images/items/slideImg2.png",
    ),
    AdsModel(
      id: 1,
      title: "50% Off + Free Delivery!",
      description:
          "Enjoy your favorite meals at half the price with zero delivery fees.",
      image: "assets/images/items/slideImg1.png",
    ),
    AdsModel(
      id: 2,
      title: "Sweet Treats, Sweater Deal!",
      description: "Get 30% off all deserts - cookies, brownies and more!",
      image: "assets/images/items/slideImg3.png",
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 200,
          child: PageView.builder(
            controller: _pageController,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: _onslideData.length,
            onPageChanged: (int index) {
              setState(() {
                _slideIndex = index;
              });
            },
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: const Color(0xffffffff),
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 2),
                      color: Color(0xffffffff),
                      spreadRadius: 2,
                      blurRadius: 2,
                    ),
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    transform: GradientRotation(0.0056),
                    stops: [0.09, 0.29, 0.54],
                    colors: [
                      const Color(0xff303030).withAlpha(85),
                      const Color(0xffffffff),
                      const Color(0xffF4CFDF),
                    ],
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              _onslideData[index].title!,
                              style: const TextStyle(
                                color: Color(0xfff45a08),
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              _onslideData[index].description!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: Color(0xff303030),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            DefaultButton(
                              onPressed: () {},
                              label: "Order Now",
                              backgroundColor: const Color(0xfff45a08),
                              foregroundColor: const Color(0xffffffff),
                              height:
                                  40, // 💡 Réduit légèrement à 40 pour éviter les overflows verticaux
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 2,
                      ), // Petit espace entre le texte et l'image
                      // L'image reste fixe à droite
                      Image.asset(
                        _onslideData[index].image!,
                        height: 90,
                        width: 90,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        SizedBox(height: 10),
        Center(
          child: SlideIndicator(
            currentIndex: _slideIndex,
            itemCount: _onslideData.length,
          ),
        ),
      ],
    );
  }
}
