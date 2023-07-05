import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/pages/auth/cubut/cubit/auth_cubit.dart';

import 'auth/login_view/login_view.dart';
import 'auth/sign_up_view/sigin_up_view.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});
  static String id = 'auth View';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create: (context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [
                      Colors.cyan,
                      Colors.amber,
                    ],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.clamp,
                  )),
                ),
                automaticallyImplyLeading: false,
                bottom: const TabBar(
                    indicatorColor: Colors.white38,
                    indicatorWeight: 5,
                    tabs: [
                      Tab(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        text: 'Login',
                      ),
                      Tab(
                        icon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        text: 'Register',
                      )
                    ]),
                title: const Text(
                  'IFood',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 55,
                    fontFamily: 'Lobster',
                  ),
                ),
                centerTitle: true,
              ),
              body: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.amber,
                    Colors.cyan,
                  ],
                )),
                child: TabBarView(
                  children: [
                    LoginView(),
                    SignUpView(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
