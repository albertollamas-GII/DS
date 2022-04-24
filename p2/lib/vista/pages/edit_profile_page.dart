import 'package:flutter/material.dart';
import '../../modelo/user.dart';
import '../../modelo/utils/user_preferences.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/profile_widget.dart';
import '../widgets/textfield_widget.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  User user = UserPreferences.myUser;

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: buildAppBar(context),
    body: ListView(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      physics: const BouncingScrollPhysics(),
      children: [
        ProfileWidget(
          imagePath: user.imagePath, 
          isEdit: true,
          onClicked: () async {},
        ),
        const SizedBox(height: 24),
        TextFieldWidget(
          label: 'Full name',
          text: user.name,
          onChanged: (name) {}
        ),
        const SizedBox(height: 24),
        TextFieldWidget(
          label: 'Email', 
          text: user.email, 
          onChanged: (email) {}
        ),        
        const SizedBox(height: 24),
        TextFieldWidget(
          label: 'About', 
          text: user.about, 
          maxLines: 5,
          onChanged: (about) {}
        ),
      ],
    )
  );
}

class ThemeSwitchingArea {
}