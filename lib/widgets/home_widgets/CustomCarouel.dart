import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:home_safety/util/quotes.dart';
import 'package:home_safety/widgets/home_widgets/safewebview.dart';

class CustomCarouel extends StatelessWidget {
  const CustomCarouel({super.key});
  void navigateToRoute(BuildContext context, Widget route) {
    Navigator.push(context, CupertinoPageRoute(builder: (context) => route));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
        options: CarouselOptions(
            aspectRatio: 2.0, autoPlay: true, enlargeCenterPage: true),
        items: List.generate(
          imageSliders.length,
          (index) => Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: InkWell(
              onTap: () {
                if (index == 0) {
                  navigateToRoute(
                      context,
                      SafeWebView(
                          url:
                              "https://food.ndtv.com/lists/5-healthy-indian-dinner-recipes-2023318"));
                } else if (index == 1) {
                  navigateToRoute(
                      context,
                      SafeWebView(
                          url:
                              "https://www.verywellhealth.com/basic-first-aid-procedures-1298578"));
                } else if (index == 2) {
                  navigateToRoute(
                      context,
                      SafeWebView(
                          url:
                              "https://www.choicehomewarranty.com/natural-disasters-home-safety-guide/"));
                } else {
                  navigateToRoute(
                      context,
                      SafeWebView(
                          url:
                              "https://www.healthline.com/health/womens-health/self-defense-tips-escape"));
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                      imageSliders[index],
                    ),
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 17, 157, 162).withOpacity(0.5),
                        Colors.transparent
                      ],
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        articleTitle[index],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
