import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instax_app/app_view.dart';
import 'package:instax_app/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:instax_app/components/mytextfield.dart';
import 'package:instax_app/components/string.dart';
import 'package:user_repository/user_repository.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  String? _errorMsg;
  bool obscureText = true;
  IconData iconPassWord = CupertinoIcons.eye_fill;

  bool containLowerCase = false;
  bool containUpperCase = false;
  bool containNumbers = false;
  bool containSpecialCase = false;
  bool contain8Length = false;
  bool signUpRequired = false;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if(state is SignUpSuccess){
          setState(() {
            signUpRequired= false;
          });
        }else if(state is SignUpLoading){
          signUpRequired= true;
        }else if(state is SignUpFailure){
          signUpRequired= false;
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
                  onChanged: (val) {
                    if (val!.contains(upperCaseExp)) {
                      setState(() {
                        containUpperCase = true;
                      });
                    } else {
                      setState(() {
                        containUpperCase = false;
                      });
                    }
                    //LowerCase
                    if (val.contains(lowerCaseExp)) {
                      setState(() {
                        containLowerCase = true;
                      });
                    } else {
                      setState(() {
                        containLowerCase = false;
                      });
                    }
                    //Contains Numbers
                    if (val.contains(numbersExp)) {
                      setState(() {
                        containNumbers = true;
                      });
                    } else {
                      setState(() {
                        containNumbers = false;
                      });
                    }
                    //SpcialCase
                    if (val.contains(specialCaseExp)) {
                      setState(() {
                        containSpecialCase = true;
                      });
                    } else {
                      setState(() {
                        containSpecialCase = false;
                      });
                    }
                    //Atleast 8 characters
                    if (val.length >= 8) {
                      setState(() {
                        contain8Length = true;
                      });
                    } else {
                      setState(() {
                        contain8Length = false;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //UpperCase
                      Text(
                        '● Atleast 1 UpperCase',
                        style: TextStyle(
                          color: containUpperCase
                              ? Colors.green
                              : Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      //Lowercase
                      Text(
                        '● Atleast 1 LowerCase',
                        style: TextStyle(
                            color: containLowerCase
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      ),
                      //Numbers
                      Text(
                        '● Atleast 1 Number 0-9',
                        style: TextStyle(
                          color: containNumbers
                              ? Colors.green
                              : Theme.of(context).colorScheme.onBackground,
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Special Char
                      Text(
                        '● Atleast 1 Special Character',
                        style: TextStyle(
                          color: containSpecialCase
                              ? Colors.green
                              : Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                      //Length
                      Text(
                        '● Contains atleast 8 characters',
                        style: TextStyle(
                            color: contain8Length
                                ? Colors.green
                                : Theme.of(context).colorScheme.onBackground),
                      )
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: MyTextField(
                  controller: nameController,
                  hintText: 'Name',
                  obscureText: false,
                  suffixIcon: IconButton(
                      onPressed: () {
                        nameController.clear();
                      },
                      icon: const Icon(CupertinoIcons.clear)),
                  keyBoardtype: TextInputType.name,
                  preffixIcon: const Icon(CupertinoIcons.person_fill),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Please enter your user name';
                    } else if (val.length > 30) {
                      return 'Name too long. Maximum of 30 Charcter';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              !signUpRequired
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              MyUser myUser = MyUser.empty;
                              myUser = myUser.copyWith(
                                email: emailController.text,
                                name: nameController.text,
                              );
                              setState(() {
                                context.read<SignUpBloc>().add(SignUpRequired(
                                    user: myUser,
                                    password: passwordController.text));
                              });
                            }
                          },
                          style: TextButton.styleFrom(
                              elevation: 0,
                              backgroundColor:
                                  Theme.of(context).colorScheme.primary,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(60),
                              )),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: Text(
                              'Sign Up',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          )),
                    )
                  : const CircularProgressIndicator()
            ],
          )),
    );
  }
}
