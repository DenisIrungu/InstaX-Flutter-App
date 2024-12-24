import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:instax_app/app_view.dart';
import 'package:instax_app/blocs/sign_bloc/sign_in_bloc.dart';
//import 'package:flutter/material.dart';
import 'package:instax_app/components/mytextfield.dart';
import 'package:instax_app/components/string.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool obscureText = true;
  IconData iconPassWord = CupertinoIcons.eye_fill;
  bool signInRequiered = false;

  String? _errorMsg;
  @override
  Widget build(BuildContext context) {
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if(state is SignInSuccess){
          setState(() {
            signInRequiered= false;
          });
        }else if(state is SignInLoading){
          setState(() {
            signInRequiered= true;
          });
        }else if(state is SignInFailure){
          signInRequiered = false;
          _errorMsg = 'Invalid password or email';
        }
      },
      child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: MyTextField(
                  controller: emailController,
                  hintText: '  name@gmail.com',
                  suffixIcon: IconButton(
                      onPressed: () {
                        emailController.clear();
                      },
                      icon: const Icon(CupertinoIcons.clear)),
                  obscureText: false,
                  keyBoardtype: TextInputType.emailAddress,
                  preffixIcon: const Icon(CupertinoIcons.mail_solid),
                  errorMsg: _errorMsg,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please enter your Email';
                    } else if (!emailRegExp.hasMatch(val)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: MyTextField(
                  controller: passwordController,
                  hintText: '  Password',
                  keyBoardtype: TextInputType.visiblePassword,
                  obscureText: obscureText,
                  preffixIcon: const Icon(CupertinoIcons.lock_fill),
                  errorMsg: _errorMsg,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please enter your password';
                    } else if (!passWordRegExp.hasMatch(val)) {
                      return 'Please enter a valid password';
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          obscureText = !obscureText;
                          if (obscureText) {
                            iconPassWord = CupertinoIcons.eye_fill;
                          } else {
                            iconPassWord = CupertinoIcons.eye_slash_fill;
                          }
                        });
                      },
                      icon: Icon(iconPassWord)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              !signInRequiered
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<SignInBloc>().add(SignInRequired(
                                  email: emailController.text,
                                  password: passwordController.text));
                            }
                          },
                          style: TextButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(60))),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    )
                  : const CircularProgressIndicator()
            ],
          )),
    );
  }
}
