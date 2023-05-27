import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:salem_package/enums/failure_type.dart';
import 'package:salem_package/salem_package.dart';
import 'package:shopping_app/domain/auth/enitity/user_entity.dart';
import 'package:shopping_app/presentation/auth/bloc/get_profile_bloc/get_profile_bloc.dart';
import 'package:shopping_app/presentation/auth/bloc/update_photo_bloc/update_photo_bloc.dart';
import 'package:shopping_app/presentation/core/source/assets.gen.dart';
import 'package:shopping_app/presentation/core/widgets/error_dialog.dart';
import 'package:shopping_app/presentation/core/widgets/error_widget.dart';

import '../../domain/auth/usecase/logout_usecase.dart';
import '../../injection.dart';
import '../core/bloc/auth_bloc.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with ScreenUtil {
  var bloc = getIt<GetProfileBloc>()..add(const GetProfileEvent.started());
  var bloc2 = getIt<UpdatePhotoBloc>();

  @override
  void initState() {
    errorMessages = {
      FailureType.networkError: "no network",
      FailureType.serverError: "Server Error"
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdatePhotoBloc, BaseState>(
      bloc: bloc2,
      listener: (context, state) {
        if (state.progress) {
          showLoading(context);
        }
        if (state.fail) {
          stopLoading(context);
          showErrorMessage(state.failure!.type, context);
        }
        if (state.success) {
          stopLoading(context);
          bloc.add(const GetProfileEvent.started());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Profile",
            style: TextStyle(fontSize: 25),
          ),
        ),
        body: BlocBuilder<GetProfileBloc, BaseState<UserEntity>>(
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
                    bloc.add(const GetProfileEvent.started());
                  });
            }
            if (state.success) {
              return Container(
                padding: const EdgeInsets.all(20),
                constraints: const BoxConstraints.expand(),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      InkWell(
                        borderRadius: BorderRadius.circular(200),
                        onTap: () async {
                          FilePickerResult? res = await FilePicker.platform
                              .pickFiles(type: FileType.image);
                          if (res != null) {
                            CroppedFile? cropped = await ImageCropper.platform
                                .cropImage(
                                    sourcePath: res.files.first.path!,
                                    cropStyle: CropStyle.rectangle,
                                    compressFormat: ImageCompressFormat.jpg,
                                    compressQuality: 50,
                                    maxHeight: 500,
                                    maxWidth: 500,
                                    uiSettings: [
                                  AndroidUiSettings(
                                    toolbarTitle: "Crop Image",
                                    toolbarColor:
                                        // ignore: use_build_context_synchronously
                                        Theme.of(context).primaryColor,
                                    hideBottomControls: true,
                                  )
                                ]);
                            if (cropped != null) {
                              bloc2.add(
                                  UpdatePhotoEvent.started(path: cropped.path));
                            }
                          }
                        },
                        child: state.item!.img == "url"
                            ? CircleAvatar(
                                backgroundColor: Theme.of(context).cardColor,
                                radius: 130,
                                child: Image.asset(
                                  Assets.images.person.path,
                                  width: 120,
                                ))
                            : CircleAvatar(
                                backgroundColor: Theme.of(context).cardColor,
                                radius: 130,
                                backgroundImage: Image.network(
                                  state.item!.img,
                                  loadingBuilder: (context, widget, chunk) {
                                    int? x = chunk?.cumulativeBytesLoaded;
                                    int? y = chunk?.expectedTotalBytes;
                                    if (x != null && y != null && x < y) {
                                      return CircularProgressIndicator(
                                        value: x / y,
                                      );
                                    }
                                    return widget;
                                  },
                                ).image),
                      ),
                      20.spaceHeight(),
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        leading: const Icon(Icons.person),
                        tileColor: Theme.of(context).cardColor,
                        title: Text(
                          state.item!.name,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontSize: 25),
                        ),
                        // subtitle: Text("Ali " , style: TextStyle(fontSize: 20),),
                      ),
                      20.spaceHeight(),
                      ListTile(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        leading: const Icon(Icons.email),
                        tileColor: Theme.of(context).cardColor,
                        title: Text(
                          state.item!.email,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(fontSize: 25),
                        ),
                        // subtitle: Text("Ali " , style: TextStyle(fontSize: 20),),
                      ),
                      20.spaceHeight(),
                      AnimatedButton(
                        loading: false,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        onPressed: () {
                          getIt<Logout>().call();
                          getIt<AuthBloc>()
                              .add(const AuthEvent.setAuth(loggedIn: false));
                          context.router.pop();
                        },
                        backGroundColor: Colors.red,
                        child: const Text(
                          "Sign Out",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
