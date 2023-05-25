import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_package/enums/failure_type.dart';
import 'package:salem_package/salem_package.dart';
import 'package:shopping_app_dashboard/domain/items/entities/item_entity.dart';
import 'package:shopping_app_dashboard/injection.dart';
import 'package:shopping_app_dashboard/presentation/core/router/app_router.dart';
import 'package:shopping_app_dashboard/presentation/core/widgets/error_widget.dart';
import 'package:shopping_app_dashboard/presentation/items/bloc/get_item_bloc/get_item_bloc.dart';
import 'package:shopping_app_dashboard/presentation/items/widgets/item_card.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  State<ItemsScreen> createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> with ScreenUtil {
  var bloc = getIt<GetItemsBloc>();

  @override
  void initState() {
    bloc.add(const GetItemEvent.started());
    errorMessages = {
      FailureType.serverError: "Server Error",
      FailureType.networkError: "no network"
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                context.pushRoute(const AddItemRoute());
              },
              icon: const Icon(Icons.add))
        ],
        title: const Text("Items"),
        leading: IconButton(
          onPressed: () async {},
          icon: const Icon(Icons.shopping_cart),
        ),
      ),
      body: BlocBuilder<GetItemsBloc, BaseState<List<ItemEntity>>>(
          bloc: bloc,
          builder: (context, state) {
            if (state.progress) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.fail) {
              return HomeErrorWidget(
                  error: errorMessages[state.failure!.type] ?? "Unknown",
                  voidCallback: () {
                    bloc.add(const GetItemEvent.started());
                  });
            }
            if (state.success) {
              return Container(
                constraints: const BoxConstraints.expand(),
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: state.item!.length,
                    padding: const EdgeInsets.all(10),
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            crossAxisSpacing: 10,
                            mainAxisExtent: 250,
                            mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return ItemCard(
                        itemEntity: state.item![index],
                      );
                    }),
              );
            }
            return const SizedBox();
          }),
    );
  }
}
