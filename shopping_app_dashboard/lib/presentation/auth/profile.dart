import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_package/enums/failure_type.dart';
import 'package:salem_package/salem_package.dart';
import 'package:shopping_app_dashboard/injection.dart';
import 'package:shopping_app_dashboard/presentation/auth/bloc/profile_bloc/profile_bloc.dart';
import 'package:shopping_app_dashboard/presentation/core/router/app_router.dart';
import 'package:shopping_app_dashboard/presentation/core/sources/assets.gen.dart';
import 'package:shopping_app_dashboard/presentation/core/widgets/error_widget.dart';

import '../../domain/auth/usecases/logout_usecase.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with ScreenUtil {
  var bloc = getIt<ProfileBloc>();
  @override
  void initState() {
    bloc.add(const ProfileEvent.started());
    errorMessages = {
      FailureType.serverError: "Server Error",
      FailureType.unAuthorized: "Permission denied",
      FailureType.networkError: "no network"
    };
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.person),
          title: const Text("Profile"),
        ),
        body: BlocBuilder<ProfileBloc, BaseState>(
            bloc: bloc,
            builder: (context, state) {
              if (state.progress) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.success) {
                return Container(
                  padding: const EdgeInsets.all(20),
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      20.spaceHeight(),
                      Image.asset(
                        Assets.images.person.path,
                        width: 280,
                      ),
                      ListTile(
                        title: const Text(
                          "name",
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Text(state.item.name,
                            style: const TextStyle(fontSize: 18)),
                      ),
                      20.spaceHeight(),
                      ListTile(
                        title: const Text(
                          "email",
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Text(state.item.email,
                            style: const TextStyle(fontSize: 18)),
                      ),
                      20.spaceHeight(),
                      AnimatedButton(
                        loading: false,
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        onPressed: () {
                          getIt<LogOutUseCase>().call().then((value) => context
                              .router
                              .pushAndPopUntil(const SignInRoute(),
                                  predicate: (route) => false));
                        },
                        backGroundColor: Theme.of(context).colorScheme.error,
                        radius: 15,
                        child: const Text(
                          "Logout",
                          style: TextStyle(fontSize: 19),
                        ),
                      )
                    ],
                  ),
                );
              } else if (state.fail) {
                return HomeErrorWidget(
                    error: errorMessages[state.failure!.type] ?? "unknown",
                    voidCallback: () {
                      bloc.add(const ProfileEvent.started());
                    });
              }
              return const SizedBox();
            }));
  }
}
