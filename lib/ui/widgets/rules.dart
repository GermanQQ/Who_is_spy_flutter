import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:who_is_spy_flutter/data/repository.dart';

class RullesWidget extends StatelessWidget {
  final buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final provider = Provider.of<Repository>(context, listen: false);

    return Center(
      child: Material(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          width: width * 0.85,
          height: 460,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
              Center(
                child: CarouselSlider(
                  carouselController: buttonCarouselController,
                  options: CarouselOptions(height: 400.0, enableInfiniteScroll: false, viewportFraction: 1),
                  items: provider.rulesList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: width * 0.85,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  height: 200,
                                  child: SvgPicture.asset(
                                    i.image,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  i.text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                                ),
                              ],
                            ));
                      },
                    );
                  }).toList(),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () => buttonCarouselController.previousPage(
                            duration: Duration(milliseconds: 300), curve: Curves.linear),
                        icon: RotatedBox(
                            quarterTurns: 2,
                            child: Icon(
                              Icons.arrow_right_alt,
                              color: Colors.white,
                              size: 35,
                            )),
                      ),
                      IconButton(
                        onPressed: () => buttonCarouselController.nextPage(
                            duration: Duration(milliseconds: 300), curve: Curves.linear),
                        icon: Icon(
                          Icons.arrow_right_alt,
                          color: Colors.white,
                          size: 35,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
