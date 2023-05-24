import 'package:flutter/material.dart';
import 'package:salem_package/extensions/num_extension.dart';

class HomeErrorWidget extends StatelessWidget {
  final String error;
  final VoidCallback voidCallback;

  const HomeErrorWidget(
      {Key? key, required this.error, required this.voidCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(22),
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //  Icon(Icons.do_not_disturb_sharp , color: Theme.of(context).colorScheme.error,size: 40,),

                  Text(error,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.error,
                          fontSize: 20)),
                  20.spaceHeight(),
                  InkWell(
                    onTap: () {
                      voidCallback.call();
                    },
                    child: Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.error,
                          borderRadius: BorderRadius.circular(22)),
                      alignment: Alignment.center,
                      child: const Text(
                        "retry",
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
