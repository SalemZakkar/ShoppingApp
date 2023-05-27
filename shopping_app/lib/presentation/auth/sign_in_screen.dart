import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_package/enums/failure_type.dart';
import 'package:salem_package/salem_package.dart';
import 'package:shopping_app/injection.dart';
import 'package:shopping_app/presentation/auth/bloc/sign_in_bloc/sign_in_bloc.dart';
import 'package:shopping_app/presentation/core/router/app_router.dart';
import 'package:shopping_app/presentation/core/utils/validator.dart';
import 'package:shopping_app/presentation/core/widgets/error_dialog.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with ScreenUtil {
  @override
  void initState() {
    errorMessages = {
      FailureType.invalidArguments: "error email / password",
      FailureType.serverError: "Server Error",
      FailureType.networkError: "network error"
    };
    super.initState();
  }

  var bloc = getIt<SignInBloc>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<SignInBloc, BaseState>(
        bloc: bloc,
        listener: (context, state) {
          if (state.progress) {
            showLoading(context);
          }
          if (state.success) {
            stopLoading(context);
            context.router.pushAndPopUntil(const HomeRoute(),
                predicate: (route) => false);
          }
          if (state.fail) {
            stopLoading(context);
            showErrorMessage(state.failure!.type , context);
          }
        },
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          constraints: const BoxConstraints.expand(),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: AutofillGroup(
              child: Form(
                key: globalKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //(MediaQuery.of(context).size.height*0.15).spaceHeight(),
                    Text(
                      "Login",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    40.spaceHeight(),
                    TextFormField(
                      autofillHints: const [AutofillHints.email],
                      controller: email,
                      validator: (value) {
                        if (!Validator.checkEmail(email.text)) {
                          return "invalid email";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(hintText: 'Email'),
                    ),
                    20.spaceHeight(),
                    TextFormField(
                      autofillHints: const [AutofillHints.password],
                      controller: password,
                      obscureText: true,
                      decoration: const InputDecoration(hintText: 'Password'),
                      validator: (value) {
                        if (!Validator.checkPassword(password.text)) {
                          return "invalid password";
                        }
                        return null;
                      },
                    ),
                    20.spaceHeight(),
                    AnimatedButton(
                        radius: 15,
                        loading: false,
                        height: 65,
                        width: MediaQuery.of(context).size.width,
                        onPressed: () {
                          if (globalKey.currentState!.validate()) {
                            bloc.add(SignInEvent.started(
                                email: email.text, password: password.text));
                          }
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        )),
                    15.spaceHeight(),
                    InkWell(
                      onTap: () {
                        context.pushRoute(const SignUpRoute());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "don't have account ?",
                            style: Theme.of(context).textTheme.bodyMedium,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
