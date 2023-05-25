import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_package/enums/failure_type.dart';
import 'package:salem_package/salem_package.dart';
import 'package:shopping_app_dashboard/injection.dart';
import 'package:shopping_app_dashboard/presentation/auth/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:shopping_app_dashboard/presentation/core/router/app_router.dart';
import 'package:shopping_app_dashboard/presentation/core/utils/validator.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with ScreenUtil {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var bloc = getIt<SignInBloc>();

  @override
  void initState() {
    errorMessages = {
      FailureType.networkError: "No network",
      FailureType.serverError: "Server Error",
      FailureType.invalidArguments: "error email / password"
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, BaseState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.progress) {
          showLoading(context);
        }
        if (state.success) {
          stopLoading(context);
          context.router.pushAndPopUntil(const HomeRoute(),
              predicate: (Route<dynamic> route) => false);
        }
        if (state.fail) {
          stopLoading(context);
          showErrorSnackMessage(context, state.failure!.type);
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          constraints: const BoxConstraints.expand(),
          alignment: Alignment.center,
          child: SizedBox(
            width: 350,
            child: Form(
              key: formKey,
              child: AutofillGroup(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Welcome!",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 35),
                      ),
                      10.spaceHeight(),
                      TextFormField(
                        decoration: const InputDecoration(hintText: "Email"),
                        autofillHints: const [AutofillHints.email],
                        controller: email,
                        validator: (value) {
                          if (!Validator.checkEmail(email.text)) {
                            return "Email is not valid";
                          }
                          return null;
                        },
                      ),
                      20.spaceHeight(),
                      TextFormField(
                        decoration: const InputDecoration(hintText: "Password"),
                        autofillHints: const [AutofillHints.password],
                        controller: password,
                        obscureText: true,
                        validator: (value) {
                          if (!Validator.checkPassword(password.text)) {
                            return "password is not valid";
                          }
                          return null;
                        },
                      ),
                      30.spaceHeight(),
                      AnimatedButton(
                        loading: false,
                        height: 40,
                        width: 100,
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            bloc.add(SignInEvent.login(
                                email: email.text, password: password.text));
                          }
                        },
                        loadColor: Colors.white,
                        child: const Text("Login"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
