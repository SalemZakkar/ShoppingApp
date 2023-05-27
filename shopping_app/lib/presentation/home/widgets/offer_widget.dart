import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/presentation/home/widgets/offer_card.dart';

class OfferWidget extends StatefulWidget {
  const OfferWidget({Key? key}) : super(key: key);

  @override
  State<OfferWidget> createState() => _OfferWidgetState();
}

class _OfferWidgetState extends State<OfferWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 220,
      alignment: Alignment.center,
      child: CarouselSlider(
        items: const [
           OfferCard(),
           OfferCard(),
           OfferCard(),
        ],
        options: CarouselOptions(
            height: 200,
            autoPlay: true,
            viewportFraction: 1,
            enlargeCenterPage: true),
      ),
    );
  }
}
