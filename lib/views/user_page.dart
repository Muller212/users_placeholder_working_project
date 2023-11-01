import 'package:flutter/material.dart';
import '../constants/constants.dart';
import '../models/users.dart';
import '../services/remote_service.dart';

//Class that shows User Datails inside Individual Card
class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);
  @override
  State<UserPage> createState() => _UserPageState();
}

//
class _UserPageState extends State<UserPage> {
  //List to store post data
  List<User>? user;
  //boolean to trigger is loaded
  var isLoaded = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    //print("ran get Data");
  }

  //function to get Data from API
  getData() async {
    user = await RemoteServices().getUsers();
    if (user != null) {
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
          itemCount: user?.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
              const EdgeInsets.only(top: 5, bottom: 5, left: 12, right: 12),
              child: Container(
                width: 300,
                height: 250,
                decoration: Constant.userPageContainer,
                child: Column(
                  children: [
                    Constant.height1,
                    //ID,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //id
                        Text(
                          'id : ',
                          style: Constant.userPageText,
                        ),
                        Text(
                          user![index].id.toString(),
                          style: Constant.userPageText,
                        ),
                      ],
                    ),
                    //Name
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Constant.height2,
                        Text(
                          'Name : ',
                          style: Constant.userPageText,
                        ),
                        //name
                        Text(
                          user![index].name,
                          style: Constant.userPageText,
                        ),
                        Constant.width3,
                        //username
                        Text('Username : ', style: Constant.userPageText),
                        Flexible(
                          child: Text(
                            user![index].username,
                            style: const TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Constant.height2,
                    //Email
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //id
                        Text(
                          'email : ',
                          style: Constant.userPageText,
                        ),
                        Text(
                          user![index].email,
                          style: Constant.userPageText,
                        ),
                      ],
                    ),
                    //
                    //Address
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //id
                        Text(
                          'address : ',
                          style: Constant.userPageText,
                        ),
                        Text(
                          user![index].address.street,
                          style: Constant.userPageText,
                        ),
                        Constant.width1,
                        Text(
                          user![index].address.city,
                          style: Constant.userPageText,
                        ),
                        Constant.width1,
                        Text(
                          user![index].address.suite,
                          style: Constant.userPageText,
                        ),
                      ],
                    ),
                    //ZipCode and Coordinates
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          user![index].address.zipcode,
                          style: Constant.userPageText,
                        ),
                        Constant.width1,
                        Text(
                          "lat: ${user![index].address.geo.lat},",
                          style: Constant.userPageText,
                        ),
                        Constant.width1,
                        Text(
                          "long: ${user![index].address.geo.lng},",
                          style: Constant.userPageText,
                        ),
                        Constant.width1,
                      ],
                    ),
                    Constant.height2,
                    //phone number
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'phone : ',
                          style: Constant.userPageText,
                        ),
                        Text(
                          user![index].phone,
                          style: Constant.userPageText,
                        ),
                      ],
                    ),
                    //Website
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //id
                        Text(
                          'website : ',
                          style: Constant.userPageText,
                        ),
                        Text(
                          user![index].website,
                          style: Constant.userPageText,
                        ),
                      ],
                    ),
                    //Company
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //id
                        Text(
                          'Company : ',
                          style: Constant.userPageText,
                        ),
                        Text(
                          user![index].company.name,
                          style: Constant.userPageText,
                        ),
                      ],
                    ),
                    //Company description
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            "${user![index].company.catchPhrase} ${user![index].company.bs} ",
                            textAlign: TextAlign.center,
                            style: Constant.userPageText,
                          ),
                        ),
                      ],
                    ),
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
              Text('Loading Users from API'),
              Constant.height1,
              CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}