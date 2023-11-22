import 'package:ap/Pages/Profile/EditProfile/edit_profile_form.dart';
import 'package:ap/Pages/Profile/ProfilePage.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          actions: [
            IconButton(
              icon: const Icon(Icons.cancel),
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (BuildContext context) => MyProfilePage()));
              },
            ),
          ],
        ),
        body: const EditProfileForm());
  }
}
