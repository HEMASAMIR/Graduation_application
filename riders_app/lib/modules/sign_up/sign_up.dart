import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:riders_app/modules/cubit/cubit/auth_cubit.dart';
import 'package:riders_app/modules/home_page/home_page.dart';

import '../../shared/widget/alert_dialog.dart';
import '../../shared/widget/custom_text_field.dart';

// ignore: must_be_immutable
class SignUp extends StatelessWidget {
  SignUp({super.key});
  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(listener: (context, state) {
      if (state is SuccessToCreateUserState) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }, builder: (context, state) {
      var cubit = BlocProvider.of<AuthCubit>(context);
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
              BlocProvider.of<AuthCubit>(context).userImageFile != null
                  ? Column(
                      children: [
                        CircleAvatar(
                          radius: MediaQuery.of(context).size.width * .15,
                          backgroundImage: FileImage(
                              BlocProvider.of<AuthCubit>(context)
                                  .userImageFile!),
                        )
                      ],
                    )
                  : OutlinedButton(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).getImage();
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
                obsText: false,
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
                  if (passwordController.text != passwordController.text) {
                    return 'password do not match';
                  }
                  return null;
                },
                hintText: 'Confirm Password',
                obsText: false,
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.cyan,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                ),
                onPressed: () {
                  if (cubit.userImageFile == null) {
                    showDialog(
                      context: context,
                      builder: (context) => const CustomAlertDialog(
                          message: 'please choose an image'),
                    );
                  }
                  if (formKey.currentState!.validate()) {
                    BlocProvider.of<AuthCubit>(context).userRegister(
                        email: emailController.text.trim(),
                        password: passwordController.text,
                        name: nameController.text.trim(),
                        confirmPassword: confirmPasswordController.text,
                        phone: phoneController.text.trim(),
                        context: context);
                  }
                },
                child: const Text(
                  "Sign up",
                  style: TextStyle(
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
    });
  }
}
