import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_package/enums/failure_type.dart';
import 'package:salem_package/salem_package.dart';
import 'package:shopping_app/presentation/core/widgets/drawer.dart';
import 'package:shopping_app/presentation/core/widgets/error_widget.dart';
import 'package:shopping_app/presentation/home/bloc/get_items_bloc/get_items_bloc.dart';
import 'package:shopping_app/presentation/home/widgets/item_card.dart';
import 'package:shopping_app/presentation/home/widgets/offer_widget.dart';

import '../../domain/home/domain/item_entity.dart';
import '../../injection.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with ScreenUtil {
  var bloc = getIt<GetItemsBloc>()..add(const GetItemsEvent.started());
  List<ItemEntity> offers = [];
  List<ItemEntity> items = [];
  bool offer = true;
  bool loaded = false;
  @override
  void initState() {
    errorMessages = {
      FailureType.networkError: "no network",
      FailureType.serverError: "server error",
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        toolbarHeight: 70,
        actions: [
          IconButton(
              onPressed: () {
                bloc.add(const GetItemsEvent.started());
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: BlocBuilder<GetItemsBloc, BaseState<List<ItemEntity>>>(
          bloc: bloc,
          builder: (context, state) {
            if (state.progress) {
              loaded = false;
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.fail) {
              return HomeErrorWidget(
                  error: errorMessages[state.failure!.type] ?? "Unknown",
                  voidCallback: () {
                    bloc.add(const GetItemsEvent.started());
                  });
            }
            if (state.success) {
              if (!loaded) {
                offers.clear();
                items.clear();
                List<ItemEntity> res = state.item!;
                for (var element in res) {
                  if (element.offer) {
                    offers.add(element);
                  } else {
                    items.add(element);
                  }
                }
                offer = offers.isNotEmpty;
                loaded = true;
              }
              return Container(
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
                      Visibility(
                        visible: offer,
                        child: OfferWidget(
                          offers: offers,
                        ),
                      ),
                      10.spaceHeight(),
                      GridView.builder(
                        cacheExtent: double.infinity,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                mainAxisExtent: 300),
                        itemBuilder: (context, index) {
                          return ItemCard(
                            itemEntity: items[index],
                          );
                        },
                        itemCount: items.length,
                      )
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          }),
    );
  }
}
