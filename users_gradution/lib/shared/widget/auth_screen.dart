import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../modules/cubit/cubit/auth_cubit.dart';
import '../../modules/login_module/login.dart';
import '../../modules/sign_up/sign_up.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});
  static String id = 'auth View';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          return DefaultTabController(
              length: 2,
              child: Scaffold(
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
                      fontFamily: 'Signatra',
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
                      SignUp(),
                    ],
                  ),
                ),
              ));
        },
      ),
    );
  }
}
