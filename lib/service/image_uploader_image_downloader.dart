import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class ImageUploaderAndImageDownloader {
  static XFile? _pickedImage;
  static File? _imageFileForSendToFirebaseStorage;
  static final storageRef = FirebaseStorage.instance.ref();
  static Uuid uuid = const Uuid();
  static List<String> downloadUrls = [];
  static bool inProgress = false;

  static Future<void> pickImageByPickerAndSendToFirebaseStorage() async {
    ImagePicker imagePicker = ImagePicker();
    _pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (_pickedImage != null) {
      _imageFileForSendToFirebaseStorage = File(_pickedImage!.path);
    }
    if(_imageFileForSendToFirebaseStorage != null) {
      Reference? imageFolderRef = storageRef.child("image");
      String imageId = uuid.v4();
      String imageExtension = ".jpg";
      final fileName = imageId + imageExtension;
      final imageReference = imageFolderRef.child(fileName);
      await imageReference.putFile(_imageFileForSendToFirebaseStorage!);
      _imageFileForSendToFirebaseStorage = null;
      _pickedImage = null;
    }
  }

  static Future<void> pickImageByCameraAndSendToFirebaseStorage() async {
    ImagePicker imagePicker = ImagePicker();
    _pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
    );
    if (_pickedImage != null) {
      _imageFileForSendToFirebaseStorage = File(_pickedImage!.path);
    }
    if(_imageFileForSendToFirebaseStorage != null) {
      Reference? imageFolderRef = storageRef.child("image");
      String imageId = uuid.v4();
      String imageExtension = ".jpg";
      final fileName = imageId + imageExtension;
      final imageReference = imageFolderRef.child(fileName);
      await imageReference.putFile(_imageFileForSendToFirebaseStorage!);
      _imageFileForSendToFirebaseStorage = null;
      _pickedImage = null;
    }
  }

  static Future<void> getImageFromFirebaseStorage(Function setStateHolder) async {
    inProgress = true;
    setStateHolder();
    final Reference folderRef = FirebaseStorage.instance.ref().child('image');
    final ListResult result = await folderRef.listAll();
    downloadUrls.clear();
    for (final Reference ref in result.items) {
      final String downloadURL = await ref.getDownloadURL();
      downloadUrls.add(downloadURL);
    }
    inProgress = false;
    setStateHolder();
  }
}