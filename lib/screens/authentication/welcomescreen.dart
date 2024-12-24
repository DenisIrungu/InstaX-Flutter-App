import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instax_app/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:instax_app/blocs/sign_bloc/sign_in_bloc.dart';
import 'package:instax_app/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:instax_app/screens/authentication/signin.dart';
import 'package:instax_app/screens/authentication/signup.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(initialIndex: 0, length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Text(
                'Welcome Back!',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: kToolbarHeight,
              ),
              TabBar(
                  dividerColor: Colors.transparent,
                  indicator: null,
                  controller: tabController,
                  unselectedLabelColor: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5),
                  labelColor: Theme.of(context).colorScheme.onBackground,
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ]),
              Expanded(
                child: TabBarView(controller: tabController, children: [
                  //We provide the signInBloc
                  BlocProvider<SignInBloc>(
                    create: (context) => SignInBloc(
                        userRepository:
                            context.read<AuthenticationBloc>().userRepository),
                    child: const SignInScreen(),
                  ),
                  //We provide the SignUpBloc
                  BlocProvider<SignUpBloc>(
                    create: (context) => SignUpBloc(
                      userRepository: context.read<AuthenticationBloc>().userRepository,
                    ),
                    child:const SignUpScreen(),
                  )
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
