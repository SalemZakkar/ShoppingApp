import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app_dashboard/domain/items/entities/item_entity.dart';

import '../../core/router/app_router.dart';

class ItemCard extends StatefulWidget {
  final ItemEntity itemEntity;

  const ItemCard({Key? key, required this.itemEntity}) : super(key: key);

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.router.push(MangeItemRoute(itemEntity: widget.itemEntity));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
              ),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  widget.itemEntity.img,
                  loadingBuilder: (context, child, chunk) {
                    if (chunk != null) {
                      int current = chunk.cumulativeBytesLoaded;
                      int total = chunk.expectedTotalBytes ?? 0;
                      if (current < total) {
                        return Center(
                            child: CircularProgressIndicator(
                          value: current / total,
                        ));
                      }
                    }
                    return child;
                  },
                  errorBuilder: (context, object, stack) {
                    return Center(
                      child: Icon(
                        Icons.error,
                        color: Theme.of(context).colorScheme.error,
                      ),
                    );
                  },
                  fit: BoxFit.cover,
                ),
              ),
            )),
            ListTile(
              title: Text(
                widget.itemEntity.name,
                style: const TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                "${widget.itemEntity.price} SYR",
                style: const TextStyle(fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
