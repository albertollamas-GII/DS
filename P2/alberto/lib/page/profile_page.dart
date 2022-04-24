// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import '../page/edit_profile_page.dart';
import '../widget/numbers_widget.dart';
import '../widget/profile_widget.dart';
import '../modelo/user.dart';
import '../utils/user_preferences.dart';
import '../widget/appbar_widget.dart';

class ProfilePage  extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);


  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context){
    const user = UserPreferences.myUser;

    return 
      Scaffold(
        
        appBar: AppBar(
          // leading: const BackButton(color: Colors.black,),
          backgroundColor: Colors.transparent,
          elevation: 0,
          automaticallyImplyLeading: false,
          ),
        body: 
        ListView(
          physics: const BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => EditProfilePage()),
                );
              },
            ),
            const SizedBox(height : 24),
            buildName(user),
            const SizedBox(height : 24),
            NumbersWidget(),
            const SizedBox(height : 48),
            buildAbout(user),

          ],
        ),
    ); 

  }

  Widget buildName(User user) => Column(
    children: [
      Text(
        user.name,
        style:const TextStyle(color: Colors.black, fontWeight:  FontWeight.bold, fontSize: 20)
      ),
      const SizedBox(height: 4),
      Text(
        user.email,
        style: const TextStyle(color: Colors.grey),
      ),
    ],
  );

  Widget buildAbout(User user) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:[
        Text(
          'About',
          style: TextStyle(color: Colors.black, fontWeight:  FontWeight.bold, fontSize: 24),
        ),
        const SizedBox(height: 16),
        Text(
          user.about,
          style: TextStyle(color: Colors.black, height: 1.4, fontSize: 16),
        ),
      ],
    ),
  );
}

