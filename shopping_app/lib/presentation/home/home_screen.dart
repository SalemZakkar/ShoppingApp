import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:salem_package/extensions/num_extension.dart';
import 'package:shopping_app/presentation/core/widgets/drawer.dart';
import 'package:shopping_app/presentation/home/widgets/item_card.dart';
import 'package:shopping_app/presentation/home/widgets/offer_widget.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        toolbarHeight: 70,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 25),
              ),
              Text(
                "Clothing Store!",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w900),
              ),
              10.spaceHeight(),
              const OfferWidget(),
              10.spaceHeight(),
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    mainAxisExtent: 300),
                itemBuilder: (context, index) {
                  return const ItemCard();
                },
                itemCount: 5,
              )
            ],
          ),
        ),
      ),
    );
  }
}
