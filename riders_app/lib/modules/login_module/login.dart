import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riders_app/modules/cubit/cubit/auth_cubit.dart';

import '../../shared/widget/custom_text_field.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  LoginView({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        // var cubit = BlocProvider.of<AuthCubit>(context);
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    Image.asset(
                      'images/signup.png',
                      height: 250,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CutomTextField(
                      controller: emailController,
                      icon: Icons.email,
                      validate: (data) {
                        if (data!.isEmpty) {
                          return 'please enter youe email';
                        }
                        return null;
                      },
                      hintText: 'Email',
                      obsText: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CutomTextField(
                      controller: passwordController,
                      icon: Icons.lock,
                      validate: (data) {
                        if (data!.length < 5) {
                          return 'password is too short';
                        }
                        return null;
                      },
                      hintText: 'Password',
                      obsText: true,
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.cyan,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30.0,
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
