import 'package:clay_world_scholl/models/visitors/visitor_data_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VisitorController {
// firebase firestore instance
  final _fireStore = FirebaseFirestore.instance;
  //  collection name
  final _visitorCollection = "visitors";

   Future<DocumentReference<Map<String, dynamic>>> addVisitor(VisitorDataModel data)async{
    return await _fireStore.collection(_visitorCollection).add(data.toJson());
  }

 Future<void> updateVisitor(VisitorDataModel data, String id)async{
    return await _fireStore.collection(_visitorCollection).doc(id).update(data.toJson());
  }
  Future<void> updateVisitorId(String id)async{
    return await _fireStore.collection(_visitorCollection).doc(id).update({"docId":id});
  }

  Future<VisitorDataModel>getVisitor(String id)async{
    var visitor =  await _fireStore.collection(_visitorCollection).doc(id).get();
    return VisitorDataModel.fromJson(visitor.data()??{});
  }
  // Stream<DocumentSnapshot<Map<String, dynamic>>>getVisitorStream(String id){
  //   return _fireStore.collection(_visitorCollection).doc(id).snapshots();
  // }
  //
  // Future<List<VisitorDataModel>> getAllVisitor()async{
  //    var visitors =  await _fireStore.collection(_visitorCollection).get();
  //    return visitors.docs.map((item)=>VisitorDataModel.fromJson(item.data())).toList();
  // }


}