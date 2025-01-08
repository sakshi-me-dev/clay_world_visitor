import 'package:clay_world_scholl/models/auth/consultant_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthController {
  var _fireStore = FirebaseFirestore.instance;
  var _consultantCollectionName = "consultants";

  var userId = FirebaseAuth.instance.currentUser?.uid;

  Future<ConsultantDataModel> getUserInfo()async{
    var data = await _fireStore.collection(_consultantCollectionName).doc(userId).get();
    return ConsultantDataModel.fromJson(data.data() ?? <String,dynamic >{});
  }
}