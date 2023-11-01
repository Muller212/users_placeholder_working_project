import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/posts.dart';
import '../services/remote_service.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  // List to store post data
  List<Post>? post;
  // Boolean to trigger if loaded
  var isLoaded = false;

  // Store the current tapped index to change color
  int? tappedIndex;

  @override
  void initState() {
    super.initState();
    getData();
  }

  // Function to get Data from API
  getData() async {
    post = await RemoteServices().getPost();
    if (post != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
          itemCount: post?.length,
          itemBuilder: (context, index) {
            final isTapped = index == tappedIndex;
            return GestureDetector(
              onTap: () {
                setState(() {
                  tappedIndex = isTapped ? null : index;
                });
              },
              child: Padding(
                padding: EdgeInsets.all(9.0),
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    color: isTapped ? Colors.lightGreenAccent :
                    Colors.blueGrey, // Change colors as needed
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 18.0,
                        height: 21.0,
                      ),
                      CircleAvatar(
                        radius: 24.0,
                        backgroundColor: Colors.green,
                        child: Text(
                          post![index].id.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15.0,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post![index].title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: Constant.postPageTitle,
                            ),
                            Text(post![index].body, style: Constant.postPageBody),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        replacement: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Loading Posts from API'),
              SizedBox(height: 10.0),
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
