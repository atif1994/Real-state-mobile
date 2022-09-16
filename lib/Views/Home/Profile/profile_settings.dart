import 'package:flutter/material.dart';
import 'package:prologic_29/Services/constants.dart';

import '../../../My Widgets/my_button.dart';
import '../../../My Widgets/my_text_field_2.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Settings')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(horizontalPadding),
          child: Column(
            children: [
              const MyTextField2(
                label: 'First Name',
              ),
              const MyTextField2(
                label: 'Last Name',
              ),
              const MyTextField2(
                label: 'Email',
              ),
              const MyTextField2(
                label: 'Phone Number',
              ),
              MyButton(
                text: 'Update Profile',
                onTap: (){

                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
