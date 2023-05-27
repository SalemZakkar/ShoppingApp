import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salem_package/enums/failure_type.dart';
import 'package:salem_package/salem_package.dart';
import 'package:shopping_app/domain/auth/enitity/user_entity.dart';
import 'package:shopping_app/presentation/auth/bloc/sign_up_bloc/sign_up_bloc.dart';
import 'package:shopping_app/presentation/core/router/app_router.dart';
import 'package:shopping_app/presentation/core/utils/validator.dart';
import 'package:shopping_app/presentation/core/widgets/error_dialog.dart';

import '../../injection.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with ScreenUtil {
  bool male = false, female = false;
  bool gender = false;
  var bloc = getIt<SignUpBloc>();
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void initState() {
    errorMessages = {
      FailureType.invalidArguments: "User Exists",
      FailureType.networkError: "no network",
      FailureType.serverError: "Server Error"
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, BaseState>(
      bloc: bloc,
      listener: (context, state) {
        if (state.progress) {
          showLoading(context);
        }
        if (state.success) {
          stopLoading(context);
          context.router
              .pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
        }
        if (state.fail) {
          stopLoading(context);
          showErrorMessage(state.failure!.type, context);
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Form(
          key: key,
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            constraints: const BoxConstraints.expand(),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //(MediaQuery.of(context).size.height*0.15).spaceHeight(),
                  Text(
                    "Sign Up",
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  40.spaceHeight(),
                  TextFormField(
                    decoration: const InputDecoration(hintText: 'Name'),
                    controller: name,
                    validator: (val) {
                      if (!Validator.checkName(name.text)) {
                        return "invalid name";
                      }
                      return null;
                    },
                  ),
                  20.spaceHeight(),
                  TextFormField(
                    controller: email,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (val) {
                      if (!Validator.checkEmail(email.text)) {
                        return "invalid Email";
                      }
                      return null;
                    },
                  ),
                  20.spaceHeight(),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    decoration: const InputDecoration(hintText: 'Password'),
                    validator: (val) {
                      if (!Validator.checkPassword(password.text)) {
                        return "invalid password";
                      }
                      if (password.text != confirmPassword.text) {
                        return "password mismatch";
                      }
                      return null;
                    },
                  ),
                  20.spaceHeight(),
                  TextFormField(
                    controller: confirmPassword,
                    obscureText: true,
                    decoration:
                        const InputDecoration(hintText: 'Confirm password'),
                    validator: (val) {
                      if (!Validator.checkPassword(password.text)) {
                        return "invalid password";
                      }
                      if (password.text != confirmPassword.text) {
                        return "password mismatch";
                      }
                      return null;
                    },
                  ),
                  20.spaceHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Gender",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 20),
                      )
                    ],
                  ),
                  20.spaceHeight(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                          value: male,
                          groupValue: true,
                          onChanged: (value) {
                            setState(() {
                              male = true;
                              female = false;
                              gender = false;
                            });
                          }),
                      Text(
                        "Male",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 20),
                      ),
                      Radio(
                          value: female,
                          groupValue: true,
                          onChanged: (value) {
                            setState(() {
                              male = false;
                              female = true;
                              gender = false;
                            });
                          }),
                      Text(
                        "Female",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: gender,
                    child: const Text(
                      "please select your gender",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  20.spaceHeight(),
                  AnimatedButton(
                      radius: 15,
                      loading: false,
                      height: 65,
                      width: MediaQuery.of(context).size.width,
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          if (!male && !female) {
                            setState(() {
                              gender = true;
                            });
                            return;
                          }
                          bloc.add(SignUpEvent.started(
                              entity: UserEntity(
                                  img: "img",
                                  name: name.text,
                                  id: "n/a",
                                  email: email.text,
                                  gender: male ? "M" : "F"),
                              password: password.text));
                        }
                      },
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
