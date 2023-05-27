import 'package:flutter/material.dart';
import 'package:shopping_app/presentation/core/source/assets.gen.dart';

class OfferCard extends StatefulWidget {
  const OfferCard({Key? key}) : super(key: key);

  @override
  State<OfferCard> createState() => _OfferCardState();
}

class _OfferCardState extends State<OfferCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    Assets.images.onBoard4.path,
                    colorBlendMode: BlendMode.darken,
                    color: Colors.black.withOpacity(0.5),
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    fit: BoxFit.cover,
                  )),
              const Padding(
                padding: EdgeInsets.only(bottom: 10, left: 20, right: 20),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Offer name",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Text(
                        "200 \$",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
