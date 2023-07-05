import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gradution_app/widgets/alert_dialog.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  // pickImage
  File? userImgFile;
  void getImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    // validate
    if (pickedImage != null) {
      userImgFile = File(pickedImage.path);
      debugPrint('Success to pick Image...');
      emit(SuccessToPickImageState());
    } else {
      debugPrint('Failed to pick Image...');
      emit(FailedToPickImageState(msg: 'Failed to pick Image..'));
    }
  }

  //register
  void userRegister({
    required String email,
    required String password,
    required String name,
    required String confirmPassword,
    required String phone,
    required BuildContext context,
    String? userId,
  }) async {
    // emit(LoadingToCreateUserState());
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user?.uid != null) {
        debugPrint(
            'Success to create user uid & uid is : ${userCredential.user!.uid}');
        String imgUrl = await uploadImageToFirebaseStorge();
        debugPrint('ImageUrl is : $imgUrl');
        await saveUserDataToFirebaseFirestore(
            name: name,
            email: email,
            userId: userCredential.user!.uid,
            password: password,
            confirmPassword: confirmPassword,
            phone: phone,
            imgUrl: imgUrl);
        emit(SuccessToCreateUserState());
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        debugPrint('The password provided is too weak.');
        showDialog(
            context: context,
            builder: (context) => const CustomAlertDialog(
                message: 'The password provided is too weak.'));
        emit(FailedToCreateUseState(msg: 'The password provided is too weak.'));
      } else if (e.code == 'email-already-in-use') {
        debugPrint('The account already exists for that email.');
        showDialog(
            context: context,
            builder: (context) => const CustomAlertDialog(
                message: ' The account already exists for that email.'));
        emit(FailedToCreateUseState(
            msg: 'The account already exists for that email.'));
      } else {
        debugPrint('failed to create user....the reason is ${e.toString()}');
        showDialog(
            context: context,
            builder: (context) => Column(
                  children: [
                    Text(
                        'failed to create user....the reason is ${e.toString()}'),
                    const SizedBox(
                      height: 10.0,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Ok'))
                  ],
                ));
      }
    }
  }

  // upload image yo firebaseStorage
  Future<String> uploadImageToFirebaseStorge() async {
    debugPrint('File image is : $userImgFile');
    debugPrint('File is  : ${basename(userImgFile!.path)}');
    Reference imageRef =
        FirebaseStorage.instance.ref(basename(userImgFile!.path));
    await imageRef.putFile(userImgFile!);
    return await imageRef.getDownloadURL();
  }
  // save user data to firebase firestore

  Future<void> saveUserDataToFirebaseFirestore({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
    required String phone,
    required String userId,
    required String imgUrl,
  }) async {
    try {
      FirebaseFirestore.instance.collection('seller').doc(userId).set({
        'userName': name,
        'id': userId,
        'email': email,
        'password': password,
        'imgUrl': imgUrl,
        'confirmPassword': confirmPassword,
        'phone': phone,
        'status': 'approved'
      });
      debugPrint('Sucess to save user data');
      emit(SuccessToSaveUserDataToFirebaseFirestore());
    } on FirebaseException catch (e) {
      debugPrint('Failed to upload data for user ${e.toString()}');
      emit(FailedToSaveUserDataToFirebaseFirestore(e.toString()));
    }
  }
}
