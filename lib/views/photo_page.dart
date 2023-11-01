import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/photo.dart';
import '../services/remote_service.dart';

class PhotoPage extends StatefulWidget {
  const PhotoPage({Key? key}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {
  //Init runs its command before build

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  //List to store Photo data from API
  List<Photo>? photo;
  //boolean to check if data has finished loading
  var isLoaded = false;

  //function to get photos
  getData() async {
    photo = await RemoteServices().getPhotos();
    if (photo != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoaded,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: photo?.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 80,
              width: 80,
              decoration: Constant.photoPageContainer,
              child: Column(
                children: [
                  Text(
                    photo![index].id.toString(),
                    style: Constant.postPageColor,
                  ),
                  Expanded(
                    child: isLoaded
                        ? Image.network(photo![index].url,
                        fit: BoxFit.cover, scale: 0.5)
                        : const CircularProgressIndicator(),
                  )
                ],
              ),
            ),
          );
        },
      ),
      replacement: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text('Loading Photos from API'),
            SizedBox(height: 10.0),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}