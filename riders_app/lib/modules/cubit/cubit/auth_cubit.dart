import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../../../shared/widget/alert_dialog.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  //pick image
  File? userImageFile;
  void getImage() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      debugPrint('Success to pick image');
      userImageFile = File(pickedImage.path);
      emit(SuccessToPickImageState());
    } else {
      emit(FailedToPickImageState(msg: 'Failed to picked image'));
    }
  }

  void userRegister({
    required String email,
    required String password,
    required String name,
    required String confirmPassword,
    required String phone,
    required BuildContext context,
    String? userId,
  }) async {
    emit(LoadingToCreateUserState());
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (userCredential.user?.uid != null) {
        debugPrint('Success to create a new user..');
        showDialog(
            context: context,
            builder: (context) =>
                const CustomAlertDialog(message: 'Success to create user...'));
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
            builder: (context) => CustomAlertDialog(
                message:
                    'failed to create user....the reason is ${e.toString()}'));
      }
    }
  }

  // upload image yo firebaseStorage
  Future<String> uploadImageToFirebaseStorge() async {
    debugPrint('File image is : $userImageFile');
    debugPrint('File is  : ${basename(userImageFile!.path)}');
    Reference imageRef =
        FirebaseStorage.instance.ref(basename(userImageFile!.path));
    await imageRef.putFile(userImageFile!);
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
      FirebaseFirestore.instance.collection('riders').doc(userId).set({
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
