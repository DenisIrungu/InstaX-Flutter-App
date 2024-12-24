import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instax_app/blocs/sign_bloc/sign_in_bloc.dart';
//import 'package:instax_app/screens/authentication/welcomescreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            Container(
                width: 50,
                height: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                )),
            const SizedBox(
              width: 10,
            ),
            const Text(
              'Welcome Denis',
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        actions: [
          IconButton(
              color: Theme.of(context).colorScheme.onBackground,
              onPressed: () {
                context.read<SignInBloc>().add(const SignOutRequired());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: ListView.builder(
          itemCount: 8,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 400,
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            )
                          ),
                        const SizedBox(width: 10,),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Denis',
                              style: TextStyle(
                                fontWeight: FontWeight.bold, 
                                fontSize: 18),
                                ),
                            Text('24-12-2024')

                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Container(
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Theme.of(context).colorScheme.tertiary
                      ),
                      child:const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('InstaX is a dynamic Flutter-based social media app designed for seamless photo and video sharing. Users can sign up with email or social accounts, explore an engaging feed, and share captivating stories that disappear after 24 hours. The app includes real-time chat for private messaging, a customizable profile for showcasing posts, and an explore feature to discover trending content. InstaX integrates Firebase for secure authentication, real-time database updates, and efficient media storage. Push notifications keep users informed of likes, comments, and messages, enhancing engagement. With a sleek, user-friendly interface, InstaX aims to redefine social interaction and creative expression on mobile.'),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
          floatingActionButton: FloatingActionButton(
            onPressed: (){},
            child:const Icon(Icons.add)),
    );
  }
}
