import 'package:flutter/material.dart';

import '../custom_text_field.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 10,
          ),
          CutomTextField(
            controller: nameController,
            icon: Icons.person,
            validate: (p0) {
              return null;
            },
            hintText: '',
            obsText: false,
          ),
          CutomTextField(
            controller: emailController,
            icon: Icons.email,
            validate: (p0) {
              return null;
            },
            hintText: 'Email',
            obsText: false,
          ),
          CutomTextField(
            controller: passwordController,
            icon: Icons.lock,
            validate: (p0) {
              return null;
            },
            hintText: 'Password',
            obsText: false,
          ),
          CutomTextField(
            controller: confirmPasswordController,
            icon: Icons.lock,
            validate: (p0) {
              return null;
            },
            hintText: 'Confirm Password',
            obsText: false,
          ),
          CutomTextField(
            controller: phoneController,
            icon: Icons.phone,
            validate: (p0) {
              return null;
            },
            hintText: 'phone',
            obsText: false,
          ),
          CutomTextField(
            controller: locationController,
            icon: Icons.my_location,
            validate: (p0) {
              return null;
            },
            hintText: 'Cafe/Resturant Address',
            obsText: false,
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
        ],
      ),
    ));
  }
}
