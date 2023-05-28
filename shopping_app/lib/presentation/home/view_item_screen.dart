import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:salem_package/salem_package.dart';
import 'package:shopping_app/domain/home/domain/item_entity.dart';

@RoutePage()
class ViewItemScreen extends StatefulWidget {
  final ItemEntity itemEntity;
  const ViewItemScreen({Key? key, required this.itemEntity}) : super(key: key);

  @override
  State<ViewItemScreen> createState() => _ViewItemScreenState();
}

class _ViewItemScreenState extends State<ViewItemScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            expandedHeight: MediaQuery.of(context).size.height * 0.9,
            stretch: true,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.itemEntity.name),
              background: CachedNetworkImage(
                imageUrl: widget.itemEntity.image,
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.darken,
                color: Colors.black.withOpacity(0.3),
              ),
              stretchModes: const [
                StretchMode.fadeTitle,
                StretchMode.blurBackground
              ],
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate((_, index) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  // title: Text(
                  //   widget.itemEntity.name,
                  //   style: Theme.of(context).textTheme.headlineMedium,
                  // ),
                  subtitle: Text(
                    widget.itemEntity.description,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                ListTile(
                  title: Text(
                    "${widget.itemEntity.price}\$",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium!
                        .copyWith(fontSize: 20, color: Colors.black),
                  ),
                ),
                10.spaceHeight(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        onPressed: () {
                          if (quantity > 1) {
                            setState(() {
                              quantity--;
                            });
                          }
                        },
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: Colors.red,
                        )),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(fontSize: 25),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            quantity++;
                          });
                        },
                        icon: const Icon(Icons.add_circle_outline)),
                  ],
                ),
                10.spaceHeight(),
                AnimatedButton(
                    loading: false,
                    backGroundColor: Theme.of(context).primaryColor,
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.5,
                    onPressed: () {},
                    child: const Text(
                      "Add To Cart",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                10.spaceHeight()
              ],
            );
          }, childCount: 1))
        ],
      ),
      // bottomNavigationBar: Container(
      //   height: 70,
      //   width: MediaQuery.of(context).size.width,
      //   alignment: Alignment.center,
      //   child: AnimatedButton(
      //       loading: false,
      //       backGroundColor: Theme.of(context).primaryColor,
      //       height: 50,
      //       width: MediaQuery.of(context).size.width * 0.5,
      //       onPressed: () {},
      //       child: const Text(
      //         "Add To Cart",
      //         style: TextStyle(color: Colors.white, fontSize: 20),
      //       )),
      // ),
    );
  }
}
