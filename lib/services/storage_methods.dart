import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

class StorageMethods {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Future<String> storeImage(String childName, Uint8List file) async {
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);
    UploadTask uploadTask = ref.putData(file);
    TaskSnapshot snap = await uploadTask;
    String imageUrl = await snap.ref.getDownloadURL();
    return imageUrl;
  }

  Future<String> storeFile(String childName, Uint8List? file) async {
    String fileUrl = '';
    Reference ref =
        _storage.ref().child(childName).child(_auth.currentUser!.uid);
    if (file != null) {
      UploadTask uploadTask = ref.putData(file);
      TaskSnapshot snap = await uploadTask;
      fileUrl = await snap.ref.getDownloadURL();
    }
    return fileUrl;
  }
}
