import 'package:clay_world_scholl/models/auth/consultant_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  final _fireStore = FirebaseFirestore.instance;
  final _consultantCollectionName = "consultants";

  var userId = FirebaseAuth.instance.currentUser?.uid;

  Future<ConsultantDataModel> getUserInfo()async{
    var data = await _fireStore.collection(_consultantCollectionName).doc(userId).get();
    print(data.data()!['name']);
    print(data.data()!['email']);
    var user =  ConsultantDataModel.fromJson(data.data() ?? <String,dynamic >{});
    return user;
  }
}