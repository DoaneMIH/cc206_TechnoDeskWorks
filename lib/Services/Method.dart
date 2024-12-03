import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserAuthentication{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> signUp ({
    required String name,
    required String email,
    required password,
  }) async {
    try{
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email.trim(), 
        password: password.trim()
      );

      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'name' : name.trim(),
        'email' : email.trim(),
      });
    }catch(e){
      return e.toString();
    }
    return null;
  }

  Future<String?> login ({
    required String email,
    required String password,
  }) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return email;
    } on FirebaseAuthException catch (e){
      return e.toString();
    }
  }


  Future<Map<String,dynamic>?> getUserDetails() async{
    try{
      User? user = FirebaseAuth.instance.currentUser;

      if(user != null){
        DocumentReference userDoc = FirebaseFirestore.instance.collection('users').doc(user.uid);
        DocumentSnapshot docSnapshot = await userDoc.get();

        if(docSnapshot.exists){
          return docSnapshot.data() as Map<String,dynamic>;
        } else {
          print('User document does not exist');
          return null;
        }
      }else {
        print('No user is signed in');
        return null;
      }
    } catch (e){
      print('Error fetching user details: $e');
      return null;
    }
  }

}