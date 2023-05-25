import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_package/enums/failure_type.dart';
import 'package:salem_package/salem_package.dart';
import 'package:shopping_app_dashboard/domain/items/entities/item_entity.dart';
import 'package:shopping_app_dashboard/injection.dart';
import 'package:shopping_app_dashboard/presentation/items/bloc/del_item_bloc/del_item_bloc.dart';
import 'package:shopping_app_dashboard/presentation/items/bloc/edit_item_bloc/edit_item_bloc.dart';

import '../core/utils/validator.dart';

@RoutePage()
class MangeItemScreen extends StatefulWidget {
  final ItemEntity itemEntity;

  const MangeItemScreen({Key? key, required this.itemEntity}) : super(key: key);

  @override
  State<MangeItemScreen> createState() => _MangeItemScreenState();
}

class _MangeItemScreenState extends State<MangeItemScreen> with ScreenUtil {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  bool active = true;
  bool offer = false;
  bool img = false;
  String imgPath = "";
  bool progress = false;
  bool edit = false;
  var bloc = getIt<EditItemBloc>();
  var bloc2 = getIt<DelItemBloc>();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    name = TextEditingController(text: widget.itemEntity.name);
    description = TextEditingController(text: widget.itemEntity.description);
    price = TextEditingController(text: widget.itemEntity.price);
    active = widget.itemEntity.active;
    offer = widget.itemEntity.offer;
    errorMessages = {
      FailureType.networkError: "no network",
      FailureType.serverError: "Server error"
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Item"),
          actions: [
            IconButton(
                onPressed: () {
                  bloc2.add(DelItemEvent.started(widget.itemEntity));
                },
                icon: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error,
                ))
          ],
        ),
        body: MultiBlocListener(
          listeners: [
            BlocListener<DelItemBloc, BaseState>(
              bloc: bloc2,
              listener: (context, state) {
                if (state.progress) {
                  showLoading(context);
                }
                if (state.fail) {
                  stopLoading(context);
                  showErrorSnackMessage(context, state.failure!.type);
                }
                if (state.success) {
                  stopLoading(context);
                  context.router.pop();
                }
              },
            ),
            BlocListener<EditItemBloc, BaseState>(
              bloc: bloc,
              listener: (context, state) {
                if (state.progress) {
                  showLoading(context);
                }
                if (state.fail) {
                  stopLoading(context);
                  showErrorSnackMessage(context, state.failure!.type);
                }
                if (state.success) {
                  stopLoading(context);
                  context.router.pop();
                }
              },
            )
          ],
          child: Container(
            alignment: Alignment.topCenter,
            constraints: const BoxConstraints.expand(),
            child: Form(
              key: key,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () async {
                        FilePickerResult? res = await FilePicker.platform
                            .pickFiles(type: FileType.image);
                        if (res != null) {
                          imgPath = res.files.first.path!;
                          img = true;
                          setState(() {});
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        decoration: BoxDecoration(
                            //  borderRadius: BorderRadius.circular(22),
                            shape: BoxShape.circle,
                            color: Theme.of(context).cardColor),
                        child: Center(
                            child: CircleAvatar(
                          radius: double.infinity,
                          backgroundImage: img
                              ? Image.file(
                                  File(imgPath),
                                  fit: BoxFit.cover,
                                ).image
                              : Image.network(widget.itemEntity.img).image,
                        )),
                      ),
                    ),
                    20.spaceHeight(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 200,
                          child: TextFormField(
                            controller: name,
                            validator: (text) {
                              if (!Validator.checkName(name.text)) {
                                return "name is invalid";
                              }
                              return null;
                            },
                            decoration:
                                const InputDecoration(hintText: "item name"),
                          ),
                        ),
                      ],
                    ),
                    20.spaceHeight(),
                    SizedBox(
                      height: 180,
                      child: TextFormField(
                        maxLines: null,
                        expands: true,
                        controller: description,
                        validator: (text) {
                          if (!Validator.checkName(description.text)) {
                            return "description is invalid";
                          }
                          return null;
                        },
                        decoration:
                            const InputDecoration(hintText: "Description"),
                      ),
                    ),
                    20.spaceHeight(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 130,
                          child: TextFormField(
                            decoration:
                                const InputDecoration(hintText: "Price"),
                            controller: price,
                            validator: (text) {
                              if (!Validator.checkPrice(price.text)) {
                                return "price is invalid";
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    20.spaceHeight(),
                    InkWell(
                      onTap: () {
                        setState(() {
                          active = !active;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: active,
                              onChanged: (value) {
                                setState(() {
                                  active = !active;
                                });
                              }),
                          10.spaceWidth(),
                          const Text(
                            "Active",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          offer = !offer;
                        });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                              value: offer,
                              onChanged: (value) {
                                setState(() {
                                  offer = !offer;
                                });
                              }),
                          10.spaceWidth(),
                          const Text(
                            "Offer",
                            style: TextStyle(fontSize: 18),
                          )
                        ],
                      ),
                    ),
                    20.spaceHeight(),
                    AnimatedButton(
                        loading: false,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        onPressed: () {
                          if (key.currentState!.validate()) {
                            bloc.add(EditItemEvent.started(
                                ItemEntity(
                                    active: active,
                                    id: widget.itemEntity.id,
                                    offer: offer,
                                    price: price.text,
                                    description: description.text,
                                    name: name.text,
                                    img: imgPath),
                                img));
                          }
                        },
                        child: const Text(
                          "Save Item",
                          style: TextStyle(fontSize: 19),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
