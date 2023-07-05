import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gradution_app/pages/auth/cubut/cubit/auth_cubit.dart';
import 'package:gradution_app/widgets/alert_dialog.dart';

import '../../../widgets/custom_text_field.dart';

// ignore: must_be_immutable
class SignUpView extends StatelessWidget {
  SignUpView({super.key});

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmPasswordController = TextEditingController();

  final phoneController = TextEditingController();

  final locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<AuthCubit>(context);
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
            child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 10,
                ),
                cubit.userImgFile != null
                    ? Column(
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.width * .15,
                            backgroundImage: FileImage(cubit.userImgFile!),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          OutlinedButton(
                            onPressed: () {
                              cubit.getImage();
                            },
                            child: const Text(
                              'Change Photo',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 22.0,
                              ),
                            ),
                          )
                        ],
                      )
                    : OutlinedButton(
                        onPressed: () {
                          cubit.getImage();
                        },
                        child: CircleAvatar(
                          radius: MediaQuery.of(context).size.width * .15,
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            size: MediaQuery.of(context).size.width * .15,
                          ),
                        ),
                      ),
                const SizedBox(
                  height: 10,
                ),
                CutomTextField(
                  controller: nameController,
                  icon: Icons.person,
                  validate: (data) {
                    if (data!.isEmpty) {
                      return 'please enter your name';
                    }
                    return null;
                  },
                  hintText: 'Name',
                  obsText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                CutomTextField(
                  controller: emailController,
                  icon: Icons.email,
                  validate: (data) {
                    if (data!.isEmpty) {
                      return 'please enter youe emailAddress';
                    }
                    return null;
                  },
                  hintText: 'Email',
                  obsText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                CutomTextField(
                  controller: passwordController,
                  icon: Icons.lock,
                  validate: (data) {
                    if (data!.length <= 5) {
                      return 'password is to less than 5';
                    }
                    return null;
                  },
                  hintText: 'Password',
                  obsText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                CutomTextField(
                  controller: confirmPasswordController,
                  icon: Icons.lock,
                  validate: (data) {
                    if (data!.isEmpty) {
                      return 'password is less than 5';
                    }
                    if (confirmPasswordController.text !=
                        passwordController.text) {
                      return 'password do not match';
                    }
                    return null;
                  },
                  hintText: 'Confirm Password',
                  obsText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                CutomTextField(
                  controller: phoneController,
                  icon: Icons.phone,
                  validate: (data) {
                    if (data!.isEmpty) {
                      return 'please enter your phone';
                    }
                    return null;
                  },
                  hintText: 'phone',
                  obsText: false,
                ),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  width: 400,
                  height: 40,
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    label: const Text(
                      "Get my Current Location",
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 10),
                  ),
                  onPressed: () {
                    if (cubit.userImgFile == null) {
                      showDialog(
                        context: context,
                        builder: (context) => const CustomAlertDialog(
                            message: 'please choose an image'),
                      );
                    }
                    if (formKey.currentState!.validate()) {
                      print(emailController.text);
                      print(passwordController.text);

                      BlocProvider.of<AuthCubit>(context).userRegister(
                        email: emailController.text.trim(),
                        password: passwordController.text,
                        confirmPassword: confirmPasswordController.text,
                        name: nameController.text,
                        phone: phoneController.text,
                        context: context,
                      );
                    }
                  },
                  child: Text(
                    state is LoadingToCreateUserState
                        ? 'loading...'
                        : "Sign up",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ));
      },
    );
  }
}
