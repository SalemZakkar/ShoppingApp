import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_package/enums/failure_type.dart';
import 'package:salem_package/salem_package.dart';
import 'package:shopping_app_dashboard/domain/items/entities/item_entity.dart';
import 'package:shopping_app_dashboard/injection.dart';
import 'package:shopping_app_dashboard/presentation/core/utils/validator.dart';
import 'package:shopping_app_dashboard/presentation/items/bloc/add_item_bloc/add_item_bloc.dart';

@RoutePage()
class AddItemScreen extends StatefulWidget {
  const AddItemScreen({Key? key}) : super(key: key);

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> with ScreenUtil {
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController price = TextEditingController();
  var bloc = getIt<AddItemBloc>();
  bool active = true;
  bool offer = false;
  bool img = false;
  String imgPath = "";
  bool progress = false;
  GlobalKey<FormState> key = GlobalKey<FormState>();

  @override
  void initState() {
    errorMessages = {
      FailureType.invalidArguments: "please add image",
      FailureType.networkError: "no network",
      FailureType.serverError: "server error",
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
      ),
      body: BlocListener<AddItemBloc, BaseState>(
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
                        child: img
                            ? CircleAvatar(
                                radius: double.infinity,
                                backgroundImage: Image.file(
                                  File(imgPath),
                                  fit: BoxFit.cover,
                                ).image,
                              )
                            : const Text(
                                "Add Photo",
                                style: TextStyle(fontSize: 20),
                              ),
                      ),
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
                          decoration: const InputDecoration(hintText: "Price"),
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
                          if (!img) {
                            showErrorSnackMessage(
                                context, FailureType.invalidArguments);
                            return;
                          }
                          bloc.add(AddItemEvent.started(ItemEntity(
                              img: imgPath,
                              name: name.text,
                              description: description.text,
                              price: price.text,
                              offer: offer,
                              active: active,
                              id: "n/a")));
                        }
                      },
                      child: const Text(
                        "Add item",
                        style: TextStyle(fontSize: 19),
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
