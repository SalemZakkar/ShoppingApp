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
      appBar: AppBar(
        title: const Text(
          "View",
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 380,
                child: CachedNetworkImage(
                  imageUrl: widget.itemEntity.image,
                  fit: BoxFit.cover,
                  placeholder: (context, string) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
              10.spaceHeight(),
              ListTile(
                title: Text(
                  widget.itemEntity.name,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
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
                      .copyWith(fontSize: 20),
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
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 70,
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: AnimatedButton(
            loading: false,
            backGroundColor: Theme.of(context).primaryColor,
            height: 50,
            width: MediaQuery.of(context).size.width * 0.5,
            onPressed: () {},
            child: const Text(
              "Add To Cart",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}
