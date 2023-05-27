import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_package/enums/failure_type.dart';
import 'package:salem_package/salem_package.dart';
import 'package:shopping_app/injection.dart';
import 'package:shopping_app/presentation/auth/bloc/sign_in_memory_bloc/sign_in_from_memory_bloc.dart';
import 'package:shopping_app/presentation/core/bloc/auth_bloc.dart';
import 'package:shopping_app/presentation/core/widgets/error_widget.dart';

import 'core/router/app_router.dart';
import 'core/source/assets.gen.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with ScreenUtil {
  var bloc = getIt<SignInFromMemoryBloc>();
  bool authError = false;
  bool progress = true;
  String error = "";

  @override
  void initState() {
    errorMessages = {FailureType.networkError: "no network"};
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is UnAuthenticated && state.firstTime) {
              context.router.pushAndPopUntil(const OnBoardRoute(),
                  predicate: (route) => false);
            } else {
              bloc.add(const SignInFromMemoryEvent.started());
            }
          },
        ),
        BlocListener<SignInFromMemoryBloc, BaseState>(
          bloc: bloc,
          listener: (context, state) {
            if (state.success) {
              context.router
                  .pushAndPopUntil(const HomeRoute(), predicate: (r) => false);
            }
            if (state.fail) {
              if (state.failure!.type == FailureType.unAuth) {
                context.router.pushAndPopUntil(const HomeRoute(),
                    predicate: (r) => false);
              } else {
                setState(() {
                  authError = true;
                  progress = false;
                  error = errorMessages[state.failure!.type] ?? "Unknown";
                });
              }
            }
            if (state.progress) {
              setState(() {
                authError = false;
                progress = true;
              });
            }
          },
        )
      ],
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          child: Stack(
            children: [
              Image.asset(
                Assets.images.onBoard4.path,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black.withOpacity(0.6),
                colorBlendMode: BlendMode.darken,
              ),
              Align(
                alignment: Alignment.center,
                child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.5),
                    child: progress
                        ? const CircularProgressIndicator()
                        : authError
                            ? HomeErrorWidget(
                                error: error,
                                voidCallback: () {
                                  bloc.add(
                                      const SignInFromMemoryEvent.started());
                                })
                            : const SizedBox()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
