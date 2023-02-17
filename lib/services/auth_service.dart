import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:revamph/models/user_model.dart';
import 'package:revamph/services/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _store = FirebaseFirestore.instance;
  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;

    DocumentSnapshot snap =
        await _store.collection('users').doc(currentUser.uid).get();
    return UserModel.fromSnap(snap);
  }

  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
    required String cllgName,
    required String mobile,
    required String year,
    required bool isAlumni,
    Uint8List? profilePic,
    Uint8List? resume,
  }) async {
    String res = 'Some error occured';
    if (profilePic == null) {
      res = 'Upload a profile picture';
    } else {
      try {
        if (email.isNotEmpty ||
            password.isNotEmpty ||
            name.isNotEmpty ||
            cllgName.isNotEmpty ||
            mobile.isNotEmpty ||
            year.isNotEmpty) {
          UserCredential cred = await _auth.createUserWithEmailAndPassword(
              email: email, password: password);

          String imageUrl =
              await StorageMethods().storeImage('profilePics', profilePic);

          String fileUrl;
          fileUrl = await StorageMethods().storeFile('resume', resume);

          UserModel user = UserModel(
              email: email,
              uid: cred.user!.uid,
              name: name,
              cllgName: cllgName,
              mobile: mobile,
              year: year,
              photoUrl: imageUrl,
              isAlumni: isAlumni,
              fileUrl: fileUrl);

          await _store
              .collection("users")
              .doc(cred.user!.uid)
              .set(user.toJson());

          res = 'success';
        }
      } on FirebaseAuthException catch (e) {
        res = e.message!;
      } catch (e) {
        res = e.toString();
      }
    }

    return res;
  }

  Future<String> logInUser({
    required String email,
    required String password,
  }) async {
    late String res;
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = 'give all credentials';
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
