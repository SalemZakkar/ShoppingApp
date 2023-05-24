import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_package/enums/failure_type.dart';
import 'package:salem_package/salem_package.dart';
import 'package:shopping_app_dashboard/injection.dart';
import 'package:shopping_app_dashboard/presentation/core/router/app_router.dart';
import 'package:shopping_app_dashboard/presentation/core/widgets/error_widget.dart';
import 'package:shopping_app_dashboard/presentation/splash/bloc/auto_login_bloc.dart';

@RoutePage()
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with ScreenUtil {
  @override
  void initState() {
    errorMessages = {
      FailureType.networkError: "no network",
      FailureType.serverError: "Server Error"
    };
    bloc.add(const AutoLoginEvent.started());
    super.initState();
  }

  var bloc = getIt<AutoLoginBloc>();
  bool load = true;
  bool failure = false;
  String errorMessage = "";
  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AutoLoginBloc, BaseState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.progress) {
          setState(() {
            load = true;
          });
        }
        if (state.success) {
          context.router
              .pushAndPopUntil(const HomeRoute(), predicate: (router) => false);
        }
        if (state.fail) {
          if (state.failure!.type == FailureType.unAuth ||
              state.failure!.type == FailureType.invalidArguments) {
            context.router.pushAndPopUntil(const SignInRoute(),
                predicate: (router) => false);
          } else {
            setState(() {
              load = false;
              failure = true;
              errorMessage =
                  errorMessages[state.failure!.type] ?? "Unknown error";
            });
          }
        }
      },
      child: Scaffold(
        body: Container(
          constraints: const BoxConstraints.expand(),
          alignment: Alignment.center,
          child: load
              ? const CircularProgressIndicator()
              : failure
                  ? HomeErrorWidget(
                      error: errorMessage,
                      voidCallback: () {
                        bloc.add(const AutoLoginEvent.started());
                      })
                  : const SizedBox(),
        ),
      ),
    );
  }
}
