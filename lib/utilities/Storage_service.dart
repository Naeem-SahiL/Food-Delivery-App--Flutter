import 'package:firebase_storage/firebase_storage.dart';

class Storage{
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<String> downloadURL(String image) async{
    String _downloadURL = await storage.ref('foods/$image').getDownloadURL();
    print('image url');
    print(_downloadURL);
    return _downloadURL;
  }
}