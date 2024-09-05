import 'package:firebase_auth/firebase_auth.dart';

Future<User> signInWithEmail(String email, String password) async {
  UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: email,
    password: password,
  );

  if(userCredential.user != null) {
    return userCredential.user!;
  }else{
    throw('No User Data');
  }
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
