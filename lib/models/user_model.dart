import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String uid;
  final String name;
  final String cllgName;
  final String mobile;
  final String year;
  final String photoUrl;
  final bool isAlumni;
  String? fileUrl;
  UserModel({
    required this.email,
    required this.uid,
    required this.name,
    required this.cllgName,
    required this.mobile,
    required this.year,
    required this.photoUrl,
    required this.isAlumni,
    this.fileUrl,
  });
  Map<String, dynamic> toJson() {
    if (fileUrl == null) {
      if (isAlumni != true) {
        return {
          'email': email,
          'uid': uid,
          'name': name,
          'cllgName': cllgName,
          'mobile': mobile,
          'admissionYear': year,
          'photoUrl': photoUrl,
        };
      } else {
        return {
          'email': email,
          'uid': uid,
          'name': name,
          'cllgName': cllgName,
          'mobile': mobile,
          'passOutYear': year,
          'photoUrl': photoUrl,
        };
      }
    } else {
      if (isAlumni != true) {
        return {
          'email': email,
          'uid': uid,
          'name': name,
          'cllgName': cllgName,
          'mobile': mobile,
          'admissionYear': year,
          'photoUrl': photoUrl,
          "fileUrl": fileUrl
        };
      } else {
        return {
          'email': email,
          'uid': uid,
          'name': name,
          'cllgName': cllgName,
          'mobile': mobile,
          'passOutYear': year,
          'photoUrl': photoUrl,
          "fileUrl": fileUrl
        };
      }
    }
  }

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      email: snapshot['email'],
      mobile: snapshot['mobile'],
      uid: snapshot['uid'],
      name: snapshot['name'],
      photoUrl: snapshot['photoURL'],
      cllgName: snapshot['cllgName'],
      year: snapshot['year'],
      isAlumni: snapshot['passOutYear'] != null,
    );
  }
}
