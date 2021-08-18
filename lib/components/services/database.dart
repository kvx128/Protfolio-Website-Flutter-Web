import 'package:web_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:web_app/models/Article.dart';

class DatabaseService {
  final CollectionReference blogCollection =
      FirebaseFirestore.instance.collection("blogs");

  // Blog Functions
  Future<void> addData(Article blogData) async {
    FirebaseFirestore.instance.collection("blogs").add({
      "id": blogData.id,
      "name": blogData.name,
      "body": blogData.body,
      "userPic": blogData.userPic,
      "color": blogData.colorCode
    }).catchError((e) => print(e));
  }

  getData() async {
    return await blogCollection.snapshots();
  }
}
