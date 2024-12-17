import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

const userSchoolName = '물리준비실';
const userSuppliesRoom = 'supplies';
enum UserRole {student, admin}
UserRole userRole = UserRole.student;
String userName = 'No name';

final FirebaseFirestore firestore = FirebaseFirestore.instance;

Future<User> signInWithEmail(String email, String password) async {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );
  final User? user = userCredential.user;
  DocumentSnapshot userDoc = await firestore.collection(userSchoolName).doc('authRole').get();

  if(user == null) {
    throw Exception('No User Data');
  } else if(userDoc.exists == false) {
    throw Exception('에러 발생: 데이터를 가져오는 과정에서 오류가 생겼습니다');
  }

  List<String> adminUid = List<String>.from(userDoc['adminUid']);

  if(adminUid.contains(user.uid)) userRole = UserRole.admin;

  userName = user.email??'No name';

  return userCredential.user!;
}

Future<User> createAccount(String email, String password) async {
  UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );

  if(userCredential.user != null) {
    return userCredential.user!;
  }else{
    throw('No User Data');
  }
}
