import 'package:application_with_firebase/service/image_uploader_image_downloader.dart';
import 'package:flutter/material.dart';

class ImageViewer extends StatefulWidget {
  const ImageViewer({super.key});

  @override
  State<ImageViewer> createState() => _ImageViewerState();
}

class _ImageViewerState extends State<ImageViewer> {
  @override
  void initState() {
    ImageUploaderAndImageDownloader.getImageFromFirebaseStorage(
      () {
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Image Viewer",
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.w700,
            fontSize: 26,
          ),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Visibility(
          visible: ImageUploaderAndImageDownloader.inProgress == false,
          replacement: const CircularProgressIndicator(),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
            ),
            itemBuilder: (context, index) {
              return GridTile(
                child: Image.network(
                    ImageUploaderAndImageDownloader.downloadUrls[index]),
              );
            },
            itemCount: ImageUploaderAndImageDownloader.downloadUrls.length,
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.purpleAccent,
            onPressed: () async {
              await ImageUploaderAndImageDownloader
                  .pickImageByCameraAndSendToFirebaseStorage();
              await ImageUploaderAndImageDownloader.getImageFromFirebaseStorage(() {
                setState(() {});
              });
            },
            child: const Icon(Icons.camera_alt_outlined),
          ),
          const SizedBox(
            width: 24,
          ),
          FloatingActionButton(
            backgroundColor: Colors.green,
            onPressed: () async {
              await ImageUploaderAndImageDownloader
                  .pickImageByPickerAndSendToFirebaseStorage();
              await ImageUploaderAndImageDownloader.getImageFromFirebaseStorage(
                () {
                  setState(() {});
                },
              );
            },
            child: const Icon(Icons.folder_copy_outlined),
          ),
          const SizedBox(
            width: 24,
          ),
          FloatingActionButton(
            backgroundColor: Colors.blueAccent,
            onPressed: () async {
              await ImageUploaderAndImageDownloader.getImageFromFirebaseStorage(
                    () {
                  setState(() {});
                },
              );
            },
            child: const Icon(Icons.sync_outlined),
          ),
        ],
      ),
    );
  }
}
